from dataclasses import asdict, dataclass
from http.client import HTTPResponse
from typing import List, Optional, Tuple
from urllib.request import Request, urlopen

from aws_lambda_powertools.utilities.data_classes import SQSEvent, event_source
from boto3.dynamodb.conditions import Attr
from bs4 import BeautifulSoup
from mypy_boto3_dynamodb import DynamoDBClient, DynamoDBServiceResource
from mypy_boto3_dynamodb.service_resource import Table
from mypy_boto3_sqs import SQSClient

from utils import (
    catching_handler,
    create_boto3_client,
    create_boto3_resource,
    create_logger,
    load_environment,
    logging_function,
)


@dataclass
class EnvironmentVariables:
    queue_url: str
    table_name: str


@dataclass
class HttpResponseWrapper:
    raw: HTTPResponse
    body: bytes


@dataclass
class FinishFlag:
    is_finish: bool
    is_banned: bool


logger = create_logger(__name__)


@logger.inject_lambda_context()
@catching_handler(logger)
@event_source(data_class=SQSEvent)
def handler(
    event: SQSEvent,
    context,
    ddb_client: DynamoDBClient = create_boto3_client(service="dynamodb"),
    ddb_resource: DynamoDBServiceResource = create_boto3_resource(service="dynamodb"),
    sqs_client: SQSClient = create_boto3_client(service="sqs"),
):
    env = load_environment(dataclass_type=EnvironmentVariables)
    table = ddb_resource.Table(name=env.table_name)
    url, next_id = generate_url(event=event)
    response = get_response(url=url)
    articles = get_article_urls(body=response.body)
    put_articles(articles=articles, ddb_client=ddb_client, table=table)
    flag_finish = is_finish(article_urls=articles, resp=response)
    if flag_finish.is_finish:
        return
    next_id = next_id if flag_finish.is_banned else generate_next_id(articles=articles)
    put_next_id(queue_url=env.queue_url, next_id=next_id, sqs_client=sqs_client)


@logging_function(logger)
def generate_url(*, event: SQSEvent) -> Tuple[str, str]:
    for record in event.records:
        next_id = record.body
        return f"https://e-hentai.org/?next={next_id}", next_id
    raise Exception("no record")


@logging_function(logger, log_return=True)
def get_response(*, url: str) -> HttpResponseWrapper:
    req = Request(url=url, headers={"User-Agent": "insomnia/2023.5.8"})
    resp = urlopen(req)
    return HttpResponseWrapper(raw=resp, body=resp.read())


@logging_function(logger)
def get_article_urls(*, body: bytes) -> List[str]:
    bs = BeautifulSoup(body, "html.parser")
    anchors = bs.select("table.itg.gltc td.gl3c.glname a")
    return [x.attrs["href"] for x in anchors]


@logging_function(logger)
def is_finish(*, article_urls: List[str], resp: HttpResponseWrapper) -> FinishFlag:
    flag_finish = True
    flag_banned = False

    if len(article_urls) > 0:
        flag_finish = False

    bs = BeautifulSoup(resp.raw, "html.parser")
    tag = bs.select_one("#nb")
    if tag is None:
        flag_finish = False
        flag_banned = True

    return FinishFlag(is_finish=flag_finish, is_banned=flag_banned)


@logging_function(logger)
def generate_next_id(*, articles: List[str]) -> str:
    url = articles[-1]
    return url.split("/")[4]


@logging_function(logger)
def put_articles(*, articles: List[str], ddb_client: DynamoDBClient, table: Table):
    err = None
    option = None
    for url in articles:
        try:
            option = {
                "Item": {"url": url},
                "ConditionExpression": Attr("url").not_exists(),
            }
            table.put_item(**option)
        except ddb_client.exceptions.ConditionalCheckFailedException:
            pass
        except Exception as e:
            err = e
            logger.warning(
                f"failed to insert url: ({type(e)}) {e}",
                exc_info=True,
                extra={"additional_data": {"command": "put_item", "option": option}},
            )

    if err:
        raise err


@logging_function(logger)
def put_next_id(*, queue_url: str, next_id: str, sqs_client: SQSClient):
    option = None
    try:
        option = {"QueueUrl": queue_url, "MessageBody": next_id, "DelaySeconds": 5}
        sqs_client.send_message(**option)
    except Exception:
        logger.warning(
            "failed to send_message",
            exc_info=True,
            extra={"additional_data": {"options": option}},
        )
        raise

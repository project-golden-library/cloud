from dataclasses import dataclass
from typing import List

import feedparser
from mypy_boto3_dynamodb import DynamoDBClient

from utils import (
    catching_handler,
    create_boto3_client,
    create_logger,
    load_environment,
    logging_function,
)


@dataclass
class EnvironmentVariables:
    dynamodb_table_name: str


FEED_URL = "https://e-hentai.org/rss/ehg.xml"

logger = create_logger(__name__)


@logger.inject_lambda_context()
@catching_handler(logger)
def handler(
    _event,
    _context,
    ddb_client: DynamoDBClient = create_boto3_client(service="dynamodb"),
):
    env = load_environment(dataclass_type=EnvironmentVariables)
    urls = get_urls()
    insert_urls(urls=urls, table_name=env.dynamodb_table_name, ddb_client=ddb_client)


@logging_function(logger=logger)
def get_urls() -> List[str]:
    feed = feedparser.parse(FEED_URL)
    return [x["link"] for x in feed.get("entries", [])]


@logging_function(logger=logger)
def insert_urls(*, urls: List[str], table_name: str, ddb_client: DynamoDBClient):
    option = None
    latest_err = None
    for u in urls:
        try:
            option = {
                "TableName": table_name,
                "Item": {"url": {"S": u}},
                "ConditionExpression": "attribute_not_exists(#url)",
                "ExpressionAttributeNames": {"#url": "url"},
            }
            ddb_client.put_item(**option)
        except ddb_client.exceptions.ConditionalCheckFailedException:
            pass
        except Exception as e:
            logger.warning(
                f"failed to put item: ({type(e)}) {e}",
                exc_info=True,
                extra={"additional_data": {"option": option}},
            )
            latest_err = e
    if latest_err:
        raise latest_err

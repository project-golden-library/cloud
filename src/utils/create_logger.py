from base64 import b64decode
from dataclasses import asdict, is_dataclass
from decimal import Decimal
from http.client import HTTPResponse
from typing import Type
from zlib import compress

from aws_lambda_powertools import Logger
from boto3.dynamodb.conditions import AttributeBase, ConditionBase


def custom_default(obj):
    if isinstance(obj, bytes):
        try:
            return str(obj)
        except UnicodeDecodeError:
            return b64decode(compress(obj, level=9)).decode()
        except Exception as e:
            return {
                "type": str(type(obj)),
                "error": {"type": str(type(e)), "msg": str(e)},
            }
    if isinstance(obj, Decimal):
        return num if (num := int(obj)) == obj else float(str(obj))
    if isinstance(obj, ConditionBase):
        return obj.get_expression()
    if isinstance(obj, AttributeBase):
        return obj.name  # type: ignore
    if is_dataclass(obj):
        return str(obj) if isinstance(obj, Type) else asdict(obj)
    if isinstance(obj, HTTPResponse):
        return {"type": str(type(obj)), "code": obj.getcode(), "body": obj.read()}
    try:
        return {"type": str(type(obj)), "value": str(obj)}
    except Exception as e:
        return {
            "type": str(type(obj)),
            "to_string error": {"type": str(type(e)), "msg": str(e)},
        }


def create_logger(name: str, **kwargs) -> Logger:
    return Logger(
        service=name,
        use_rfc3339=True,
        level="DEBUG",
        json_default=custom_default,
        **kwargs,
    )

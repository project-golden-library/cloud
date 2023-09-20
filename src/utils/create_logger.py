from dataclasses import asdict, is_dataclass
from decimal import Decimal
from typing import Type

from aws_lambda_powertools import Logger
from boto3.dynamodb.conditions import AttributeBase, ConditionBase


def custom_default(obj):
    if isinstance(obj, Decimal):
        return num if (num := int(obj)) == obj else float(str(obj))
    if isinstance(obj, ConditionBase):
        return obj.get_expression()
    if isinstance(obj, AttributeBase):
        return obj.name
    if is_dataclass(obj):
        return str(obj) if isinstance(obj, Type) else asdict(obj)
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

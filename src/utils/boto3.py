from typing import Optional

import boto3
from boto3.resources.base import ServiceResource
from botocore.client import BaseClient
from botocore.config import Config

CONFIG_DEFAULT = Config(
    connect_timeout=10, read_timeout=10, retries={"mode": "standard"}
)


def create_boto3_client(
    *, service: str, config: Optional[Config] = None, **kwargs
) -> BaseClient:
    return boto3.client(
        service_name=service, config=config if config else CONFIG_DEFAULT, **kwargs
    )


def create_boto3_resource(
    *, service: str, config: Optional[Config] = None, **kwargs
) -> ServiceResource:
    return boto3.resource(
        service_name=service, config=config if config else CONFIG_DEFAULT, **kwargs
    )

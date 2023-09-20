import os
from dataclasses import fields
from typing import Type, TypeVar

from utils import create_logger, logging_function

logger = create_logger(__name__)
T = TypeVar("T")


@logging_function(logger=logger, log_return=True)
def load_environment(*, dataclass_type: Type[T]) -> T:
    return dataclass_type(
        **{k.name: os.environ[k.name.upper()] for k in fields(dataclass_type)}
    )

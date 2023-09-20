from aws_lambda_powertools import Logger
from typing import Callable
from functools import wraps


def catching_handler(logger: Logger) -> Callable:
    def wrapper(func: Callable):
        @wraps(func)
        def process(event, *args, **kwargs):
            try:
                logger.debug("event data", extra={"additional_data": event})
                return func(*args, **kwargs)
            except Exception as e:
                logger.error(
                    f"error occurred in handler: ({type(e)}) {e}", exc_info=True
                )
                raise

        return process

    return wrapper

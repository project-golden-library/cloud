from functools import wraps
from aws_lambda_powertools import Logger
from typing import Callable


def logging_function(logger: Logger, log_return: bool = False) -> Callable:
    def wrapper(func: Callable):
        @wraps(func)
        def process(*args, **kwargs):
            try:
                result = func(*args, **kwargs)
                if log_return:
                    logger.debug(
                        f'function "{func.__name__}" result',
                        extra={"additional_data": {"return": result}},
                    )
                return result
            except Exception as e:
                logger.debug(
                    f"error occurred in {func.__name__}: ({type(e)}) {e}",
                    exc_info=True,
                    extra={"additional_data": {"args": args, "kwargs": kwargs}},
                )
                raise

        return process

    return wrapper

from typing import Any
from collections.abc import Callable 


class Logger:
    def __init__(self):
        self.name = "loggername"

    def info(self, x: str):
        print(f"logger: ... {x}")
        return


logger = Logger()


def server():
    print("use server data")


def local():
    print("use local offline data")

# Strategy Pattern used, Higher Order function

def serverWithLocalFallback(
    isOnline: bool,
    logger: Logger,
    fallbackLog: str,
    server: Callable[[], Any] = server,
    local: Callable[[], Any] = local,
) -> Any:
    
    if isOnline:
        try:
            return server()
        except Exception as e:
            logger.info(fallbackLog)

    return local()

print("-----------------------------------------------")

# Online mode
serverWithLocalFallback(
    isOnline=True,
    logger=logger,
    fallbackLog="Server unreachable, use local routine",
)

print("-----------------------------------------------")

# Offline mode, use local data
serverWithLocalFallback(
    isOnline=False,
    logger=logger,
    fallbackLog="Server unreachable, use local routine",
)

print("-----------------------------------------------")

# Online but server throws exception, use local data
def failing_server():
    print("server fail...")
    raise RuntimeError("Connection lost later")

serverWithLocalFallback(
    isOnline=True,
    logger=logger,
    fallbackLog="Server unreachable, use local routine",
    server=failing_server,
)

print("-----------------------------------------------")

# OUTPUT
# use server data
# -----------------------------------------------
# use local offline data
# -----------------------------------------------
# server fail...
# logger: ... Server unreachable, use local routine
# use local offline data



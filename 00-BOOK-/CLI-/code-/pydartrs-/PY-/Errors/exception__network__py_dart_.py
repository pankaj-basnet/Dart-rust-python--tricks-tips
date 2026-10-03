import ssl

def is_network_error(e: object) -> bool:
    print(f"check error -- {type(e).__name__} - {e}")
    return isinstance(e, (TimeoutError, ConnectionError, OSError, ssl.SSLError))

try:
    raise TimeoutError("after 30 seconds.")
except Exception as err:
    result = is_network_error(err)
    print(f"network error? {result}")


# Keywords
# object | isinstance | TimeoutError | ConnectionError | OSError | ssl.SSLError | try...except

# Dart Keywords
# Object | is | TimeoutException | SocketException | HandshakeException | http.ClientException | try...catch



# pydartrs-\DART-\errors\bin\errors.dart
# pydartrs-\PY-\Errors\exception__network__py_dart_.py

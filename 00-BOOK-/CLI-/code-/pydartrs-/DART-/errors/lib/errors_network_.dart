import 'dart:io';
import 'dart:async';

import 'package:http/http.dart' as http;

bool isNetworkError(Object e) {
  print("Check error: ${e.runtimeType} - $e");
  return e is http.ClientException ||
      e is SocketException ||
      e is HandshakeException ||
      e is TimeoutException;
}

void main() {
  try {
    throw TimeoutException("after 30 seconds.");
  } catch (err) {
    bool result = isNetworkError(err);
    print("error? $result");
  }
}

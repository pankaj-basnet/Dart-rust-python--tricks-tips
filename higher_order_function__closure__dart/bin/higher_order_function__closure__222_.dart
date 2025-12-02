void main(List<String> arguments) async {
  final result = await overlayFunc(() => 'Login Screen Shown 🙌');

  print(result);
}

typedef LoginScreen = String Function();

Future<String> overlayFunc(LoginScreen loginScreen) async {
  var sales = 1000;

  var loginScreenMessage = 'placeholder';
  print(loginScreenMessage);

  void increaseSales() {
    sales += 50;
    print('🟦 increased sales to $sales');
  }

  void decreaseSales() {
    print('sales decrease not allowed');
  }

  void willHideAndRunTwoFunctions() {
    increaseSales();
    decreaseSales();

    loginScreenMessage = loginScreen();
  }

  print('🟦 Login screen says: ${loginScreen()}');

  // Awaiting the password function
  final returnedPassword = await passwordFunc(willHideAndRunTwoFunctions);

  print(loginScreenMessage);

  return 'got password as $returnedPassword and final sales = $sales';
}

Future<String> passwordFunc(void Function() func) async {
  return await Future.delayed(const Duration(seconds: 2), () {
    func();
    return 'goodPassword';
  });
}


// D:\src_dev\flutter\DART-PYTHON-RUST--TIPS-AND-TRICKS-\code-\dartConcepts\higher_order_function__closure__dart\bin\higher_order_function__closure__222_.dart
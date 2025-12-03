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

  // ✨ modified to behave like sqrtClosure with 4 inner variables
  void willHideAndRunTwoFunctions() {
    // ✨ target value captured like “a” in sqrt(a)
    final targetSales = sales; // ✨

    // ✨ inner variable like guess
    var adjustedSales = targetSales.toDouble(); // ✨

    // ✨ update function like sqrt_update
    double updateSales(double x) => (x + targetSales / x) / 2; // ✨

    // ✨ close function like sqrt_close
    bool closeEnough(double x) => (x - targetSales).abs() < 0.001; // ✨

    // ✨ iterative improvement (like improve())
    while (!closeEnough(adjustedSales)) {
      adjustedSales = updateSales(adjustedSales); // ✨
    }

    // ✨ Map final result back into the original variable pattern
    loginScreenMessage = "Sales stabilized at ${adjustedSales.toStringAsFixed(2)}"; // ✨
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

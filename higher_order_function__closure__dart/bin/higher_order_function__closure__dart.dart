void main(List<String> arguments) {
  // 🟦 Added sample usage so program actually runs
  final result = overlayFunc(
    () => 'Login Screen Shown',
  ); // LoginScreen typedef applied
  print(result);
}

typedef LoginScreen = String Function();

String overlayFunc(LoginScreen loginScreen) {
  var sales = 1000;

  void increaseSales() {
    sales = sales + 50;
    print('🟦 increased sales to $sales'); // 🟦 added print
  }

  void decreaseSales() {
    print('sales decrease not allowed');
  }

  void willHideAndRunTwoFunctions() {
    increaseSales();
    decreaseSales();
  }

  // 🟦 Added: actually call loginScreen to avoid unused variable
  print('🟦 Login screen says: ${loginScreen()}');

  var returnedPassword = passwordFunc(willHideAndRunTwoFunctions);
  return 'got password as $returnedPassword and final sales = $sales'; // 🟦 added sales info
}

// String passwordFunc(void Function() func) {
Future<String> passwordFunc(void Function() func) async {
  // func();
  // return 'goodPassword';

  final pas = Future.delayed(const Duration(seconds: 2), () {
    func();
    return 'goodPassword';
  });

  final passwordReturned = await pas;
  return passwordReturned;
}


// D:\src_dev\flutter\DART-PYTHON-RUST--TIPS-AND-TRICKS-\code-\dartConcepts\higher_order_function__closure__dart\bin\higher_order_function__closure__dart.dart


// // typedef HideAndReturnPassoword = void Function(void Function());
// typedef HideAndReturnPassoword = void Function();
// String passwordFunc( HideAndReturnPassoword hideAndReturnPassoword){

//   // hideAndReturnPassoword('goodPassword');

//   return 'goodPassword';
// }
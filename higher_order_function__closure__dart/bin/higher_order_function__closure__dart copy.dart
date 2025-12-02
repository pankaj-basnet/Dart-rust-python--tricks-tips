/// rough notes -----  important  --- edit code for practice learning
// void main(List<String> arguments) {

//   // final overlay = overlayFunc(() => 'login good',);
//   final overlay = overlayFunc(passwordFunc(()=> 'hide'));


// }

// void main(List<String> arguments) {}


// typedef LoginScreen = String Function( );

// String overlayFunc(LoginScreen loginScreen) {

//   var sales = 1000;



//   void increaseSales (){
//     sales = sales + 50;
    
//   }

//   void decreaseSales(){
//     print('sales decrease  not allowed ');
//   }



//   void willHideAndRunTwoFunctions(){
//     increaseSales();
//     decreaseSales();
//   }

// var returnedPassword = passwordFunc(willHideAndRunTwoFunctions);
// return 'got password as $returnedPassword';

// }


// String passwordFunc(void Function() func){

//   func();
//   return 'goodPassword';
// }

// // D:\src_dev\flutter\DART-PYTHON-RUST--TIPS-AND-TRICKS-\code-\dartConcepts\higher_order_function__closure__dart\bin\higher_order_function__closure__dart.dart


// // // typedef HideAndReturnPassoword = void Function(void Function());
// // typedef HideAndReturnPassoword = void Function();
// // String passwordFunc( HideAndReturnPassoword hideAndReturnPassoword){

// //   // hideAndReturnPassoword('goodPassword');

// //   return 'goodPassword';
// // }
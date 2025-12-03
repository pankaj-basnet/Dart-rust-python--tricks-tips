// FILE: closure_snapshot_overlay.dart

void main(List<String> arguments) async {
  final result = await overlayController(() => 'Login Screen Ready 🎯');

  print(result);
}

typedef LoginScreen = String Function();

Future<String> overlayController(LoginScreen loginScreen) async {
  var sales = 1200;
  var overlayVisible = true;
  var overlayMessage = '⏳ Preparing overlay...';
  print(overlayMessage);

  // ---------------------------------------------------------------
  // 1️⃣ A closure capturing "snapshot" of UI state at creation time
  // ---------------------------------------------------------------
  Function makeOverlaySnapshot(String title) {
    // These captured values are frozen at closure creation time
    final capturedTime = DateTime.now();            // snapshot 1
    final capturedSales = sales;                    // snapshot 2
    final capturedOverlayVisible = overlayVisible;  // snapshot 3
    final capturedTitle = title;                    // snapshot 4

    return () {
      print('📸 Snapshot Report');
      print('   Title: $capturedTitle');
      print('   Time: $capturedTime');
      print('   Sales at snapshot: $capturedSales');
      print('   Overlay Visible: $capturedOverlayVisible');
      print('-------------------------------------------');
    };
  }

  // create a snapshot function (closure)
  final showOverlaySnapshot =
      makeOverlaySnapshot(loginScreen()); // snapshot taken *now*

  overlayMessage = 'Overlay: ${loginScreen()}';
  print('🟦 $overlayMessage');

  // ---------------------------------------------------------------
  // 2️⃣ Additional closure-based logic: overlay fade-out simulation
  // ---------------------------------------------------------------
  void fadeOutOverlay() {
    double opacity = 1.0;

    double update(double x) => x - 0.2;            // update step
    bool done(double x) => x <= 0.0;               // stop condition

    while (!done(opacity)) {
      opacity = update(opacity);
      print('🌫️ Overlay fading... opacity = ${opacity.toStringAsFixed(2)}');
    }

    overlayVisible = false;
  }

  // ---------------------------------------------------------------
  // 3️⃣ Higher-order: passwordFunc triggers snapshot + fade-out
  // ---------------------------------------------------------------
  Future<String> passwordFunc(Function callback) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      callback(); // call snapshot closure
      fadeOutOverlay(); // run fade effect
      return 'securePassword456!';
    });
  }

  // ---------------------------------------------------------------
  // Execute snapshot + fade-out through async passwordFunc
  // ---------------------------------------------------------------
  final resultPassword = await passwordFunc(showOverlaySnapshot);

  // ---------------------------------------------------------------
  // Final screen state after closure logic
  // ---------------------------------------------------------------
  print('Overlay visible? $overlayVisible');
  print('Result password: $resultPassword');
  print('Final sales: $sales');

  return 'Operation completed with password $resultPassword';
}

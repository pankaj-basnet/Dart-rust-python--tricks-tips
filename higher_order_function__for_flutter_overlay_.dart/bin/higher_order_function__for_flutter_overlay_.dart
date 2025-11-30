import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:higher_order_function__for_flutter_overlay_/higher_order_function__for_flutter_overlay_.dart'
    as higher_order_function__for_flutter_overlay_;

void main(List<String> arguments) {}

/// true means loginScreen is shown and then, later closed
typedef ContentBuilder = bool Function(bool Function(Uint8List? result) ondone);

/// Overlay for loginScreen ( either PasswordScreen or PinScreen )
class AuthScreenOverlay {
  /// if _uihandle == null, loginScreen is removed
  int? _uihandle;

  final ContentBuilder contentBuilder;

  /// Singleton pattern
  AuthScreenOverlay._(this.contentBuilder);
  static AuthScreenOverlay? _instance;
  factory AuthScreenOverlay.instance({required ContentBuilder builder}) =>
      _instance ?? (_instance = AuthScreenOverlay._(builder));

  /// show UI and return a future
  Future<Uint8List?> show() {
    /// show() already running, loginScreen visible
    if (_uihandle != null) {
      return Future.value(null);
    }

    final completer = Completer<Uint8List?>();

    _show(completer.complete);

    return completer.future;
  }

  void _show(void Function(Uint8List? result) onDone) {
    _uihandle = 1;
    // start loginScreen showing process

    final isLoginScreenShownAndRemoved = contentBuilder(
      /// this function is called by loginScreen to provide "password" to completer
      (password) {
        _hide();
        onDone(password);

        // completer run with provided "password"
        return true;
      },

      
    );

    print(isLoginScreenShownAndRemoved);

    // final password = <Uint8List>[ 97, 98, 99, 100, 101 ];
    // final Uint8List password = Uint8List.fromList(utf8.encode("abcdef"));
  }

  void _hide() {
    // resolves multiple taps on screen
    Future.delayed(const Duration(milliseconds: 50), () {
      _uihandle = null;
    });
  }
}

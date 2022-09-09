import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karaoke_app/service/auth_service.dart';
import 'package:karaoke_app/service/google_sign_in_service.dart';

final loginControllerProvider = ChangeNotifierProvider<LoginController>((ref) {
  return LoginController(ref.read);
});

class LoginController extends ChangeNotifier {
  final Reader _reader;
  LoginController(this._reader);
  String errorMessage = '';

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    await _reader(authServiceProvider)
        .loginUser(email: email, password: password);
  }

  Future<void> handleSignIn() async {
    await _reader(googleSignInServiceProvider).handleSignIn();
  }

  void setErrorText(String errorText) {
    errorMessage = errorText;
    notifyListeners();
  }
}

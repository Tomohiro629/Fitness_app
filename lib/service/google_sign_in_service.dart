import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignInServiceProvider = Provider<GoogleSignInService>((ref) {
  return GoogleSignInService();
});

class GoogleSignInService {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    "email",
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  Future<void> handleSignIn() async {
    try {
      await googleSignIn.signIn();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

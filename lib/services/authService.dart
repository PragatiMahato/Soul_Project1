import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle(BuildContext context) async {
    String webClientID =
        '930363161118-f4tc7a07cd93ega5q7sgvl6snjhfmcb3.apps.googleusercontent.com';
    try {
      GoogleSignIn signIn = GoogleSignIn.instance;
      await signIn.initialize(serverClientId: webClientID);

      GoogleSignInAccount account = await signIn.authenticate();
      GoogleSignInAuthentication googleAuth = account.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      return _auth.currentUser;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }

  // Log Out
  Future<void> signOut() async {
    try {
      GoogleSignIn signIn = GoogleSignIn.instance;
      await signIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print("Sign out failed: $e");
      rethrow;
    }
  }
}

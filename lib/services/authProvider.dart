// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthProvider extends ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   User? user;
//   bool isLoading = false;
//   String? error;

//   AuthProvider() {
//     _auth.authStateChanges().listen((u) {
//       user = u;
//       notifyListeners();
//     });
//   }

//   // 🔐 SIGN UP
//   Future<void> signUp(String email, String password) async {
//     try {
//       isLoading = true;
//       notifyListeners();

//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       error = e.message;
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   // 🔐 LOGIN
//   Future<void> login(String email, String password) async {
//     try {
//       isLoading = true;
//       notifyListeners();

//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       error = e.message;
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   // 🚪 LOGOUT
//   Future<void> logout() async {
//     await _auth.signOut();
//     notifyListeners();
//   }
// }

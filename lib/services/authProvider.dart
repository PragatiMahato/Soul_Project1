// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:soul_project/services/authService.dart';


// class AuthProvider extends ChangeNotifier {
//   User? _user;
//   User? get user => _user;

//   bool _loading = false;
//   bool get loading => _loading;

//   Future<void> loginWithGoogle() async {
//     _loading = true;
//     notifyListeners();

//     final result = await AuthService.signInWithGoogle();
//     _user = result;

//     _loading = false;
//     notifyListeners();
//   }

//   Future<void> logout() async {
//     await AuthService.signOut();
//     _user = null;
//     notifyListeners();
//   }
// }

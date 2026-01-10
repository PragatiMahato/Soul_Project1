// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:flutter/services.dart';

// class BiometricAuthScreen extends StatefulWidget {
//   const BiometricAuthScreen({super.key});

//   @override
//   State<BiometricAuthScreen> createState() => _BiometricAuthScreenState();
// }

// class _BiometricAuthScreenState extends State<BiometricAuthScreen> {
//   final LocalAuthentication _auth = LocalAuthentication();
//   bool _isAuthenticating = false;
//   String authStatus = 'Not Authenticated';

//   Future<void> _authenticate() async {
//     try {
//       setState(() {
//         _isAuthenticating = true;
//         authStatus = 'Authenticating...';
//       });

//       final authenticated = await _auth.authenticate(
//         localizedReason: 'Authenticate to continue',
//         biometricOnly: true,
//       );

//       setState(() {
//         _isAuthenticating = false;
//         authStatus = authenticated ? 'Authorized' : 'Not Authorized';
//       });
//     } on PlatformException catch (e) {
//       setState(() {
//         _isAuthenticating = false;
//         authStatus = e.message ?? 'Authentication failed';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Biometric Login')),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.fingerprint, size: 80),
//             const SizedBox(height: 20),
//             Text(authStatus),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _isAuthenticating ? null : _authenticate,
//               child: const Text('Authenticate'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

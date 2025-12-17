// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../services/authProvider.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final auth = context.watch<AuthProvider>();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Sign Up")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: "Email",
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: "Password",
//               ),
//             ),
//             const SizedBox(height: 24),

//             if (auth.isLoading)
//               const CircularProgressIndicator()
//             else
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     await auth.signUp(
//                       emailController.text.trim(),
//                       passwordController.text.trim(),
//                     );

//                     if (auth.user != null && context.mounted) {
//                       Navigator.pushReplacementNamed(
//                         context,
//                         "/homepage",
//                       );
//                     }
//                   },
//                   child: const Text("Create Account"),
//                 ),
//               ),

//             if (auth.error != null) ...[
//               const SizedBox(height: 12),
//               Text(
//                 auth.error!,
//                 style: const TextStyle(color: Colors.red),
//               ),
//             ],

//             const SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text("Already have an account? Login"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

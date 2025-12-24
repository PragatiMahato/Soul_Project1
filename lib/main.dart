// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/wallet/home.dart';
import 'wallet/wallet_screen.dart'; // ✅ Import the file where HomeScreen is

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

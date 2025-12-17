import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appImages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, "/onboarding");
    });
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SizedBox(
          width: 172,
          height: 172,
          child: Image(
            image: AssetImage(AppImages.splashLogo),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';

import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/feature_flow.dart';

import 'package:soul_project/Presentations/widgets/customButton.dart';
import 'package:soul_project/services/authService.dart';



class OnoardingScreen extends StatefulWidget {
  const OnoardingScreen({super.key});

  @override
  State<OnoardingScreen> createState() => _OnoardingScreenState();
}

class _OnoardingScreenState extends State<OnoardingScreen> {
  late final PageController _controller;
  final AuthService _authService = AuthService();
  int currentIndex = 0;
  bool isloading = false;

  final List<Map<String, String>> onbordingData = [
    {
      "title": "Welcome to Soul",
      "subtitle":
          "A privacy-first way to verify your identity—powered by zero-knowledge technology.",
    },
    {
      "title": "Your data. Your control.",
      "subtitle":
          "Keep your information safe and on your local devices — exactly where it belongs.",
    },
    {
      "title": "Proof without exposure",
      "subtitle": "Verify who you are without ever revealing personal details.",
    },
  ];

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onbordingData.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentIndex == index ? 32 : 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.black
                : AppColors.greyButton,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
// Future<void> _handleGoogleSignIn() async {
//   setState(() => isloading = true);

//   try {
//     final user = await _authService.signInWithGoogle(context);

//     if (user != null) {
//       // Run the centralized flow
//       await runFeatureFlow(context);
//     }
//   } finally {
//     setState(() => isloading = false);
//   }
// }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    onbordingData[currentIndex]["title"]!,
                    style: AppStyle.smallText,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    onbordingData[currentIndex]["subtitle"]!,
                    style: AppStyle.heading1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 332,
              child: PageView.builder(
                controller: _controller,
                itemCount: onbordingData.length,
                onPageChanged: (index) => setState(() => currentIndex = index),
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: AppColors.greyButton,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildIndicator(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
              child: isloading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      text: "Continue with Google",
                      onPressed: () async {
    setState(() => isloading = true);
    final user = await _authService.signInWithGoogle(context);
    setState(() => isloading = false);

    if (user != null) {
      await runFeatureFlow(context, user.uid);
    }}

                    ),
            ),
          ],
        ),
      ),
    );
  }
}

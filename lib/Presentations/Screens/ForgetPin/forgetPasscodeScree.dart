import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';
import 'package:soul_project/Presentations/Widgets/customButton.dart';
import 'package:soul_project/Presentations/widgets/customTextfield.dart';

class ForgotPasscodeScreen extends StatefulWidget {
  const ForgotPasscodeScreen({super.key});

  @override
  State<ForgotPasscodeScreen> createState() => _ForgotPasscodeScreenState();
}

class _ForgotPasscodeScreenState extends State<ForgotPasscodeScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isValidEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true, // Moves up on keyboard
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, size: 22),
              ),

              const SizedBox(height: 20),

              Text("What's your Email address?", style: AppStyle.heading1),

              const SizedBox(height: 6),

              Text(
                "We will send you 6 digit verification code via email",
                style: AppStyle.smallText,
              ),

              const SizedBox(height: 24),

              CustomTextfield(
                hint: "Enter Email Address",
                controller: emailController,
                onChanged: (value) {
                  setState(() {
                    isValidEmail = value.contains("@") && value.contains(".");
                  });
                },
              ),

              const SizedBox(height: 20),

              Text.rich(
                TextSpan(
                  text: "By clicking, I agree to the ",
                  style: AppStyle.smallText,
                  children: [
                    TextSpan(
                      text: "User Agreement",
                      style: AppStyle.smallText.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: AppStyle.smallText.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomButton(
                  text: "Continue",
                  onPressed: isValidEmail
                      ? () {
                          Navigator.pushNamed(context, "/notificationScreen");
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

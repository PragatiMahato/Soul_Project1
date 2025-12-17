import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';
import 'package:soul_project/Presentations/Screens/Passcode/widgets/display.dart';
import 'package:soul_project/Presentations/Screens/Passcode/widgets/number_pad.dart';

class CreatePasscodeScreen extends StatefulWidget {
  const CreatePasscodeScreen({super.key});

  @override
  State<CreatePasscodeScreen> createState() => _CreatePasscodeScreenState();
}

class _CreatePasscodeScreenState extends State<CreatePasscodeScreen> {
  String passcode = "";

  void addDigit(String digit) {
    if (passcode.length < 6) {
      setState(() => passcode += digit);
      if (passcode.length == 6) {
        Future.delayed(const Duration(milliseconds: 200), () {
          Navigator.pushNamed(context, "/notificationScreen");
        });
      }
    }
  }

  void deleteDigit() {
    if (passcode.isNotEmpty) {
      setState(() => passcode = passcode.substring(0, passcode.length - 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, size: 18, color: AppColors.black),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create a Login Passcode", style: AppStyle.heading1),

                  SizedBox(height: 10),

                  Text(
                    "You'll be able to log in using the following passcode.",
                    style: AppStyle.smallText,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            PassCodeDisplay(length: 6, filled: passcode.length),

            Spacer(),

            NumberPad(onDigitPress: addDigit, onDeletePress: deleteDigit),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:soul_project/Presentations/Widgets/customButton.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final pinController = TextEditingController();
  bool isValidLength = false;
  bool showError = false;

  int seconds = 15;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() => seconds--);
      }
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: showError ? Colors.red : Colors.black,
          width: 1.3,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back),
              ),
              
              const SizedBox(height: 20),
              const Text(
                "Enter a Verification Code",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),
              const Text(
                "We have sent 6 digit code to your email john.doe@gmail.com",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 30),

              Center(
                child: Pinput(
                  length: 6,
                  controller: pinController,
                  defaultPinTheme: defaultPinTheme,
                  
                  onChanged: (value) {
                    setState(() {
                      isValidLength = value.length == 6;
                      if (isValidLength) showError = false;
                    });
                  },
                ),
              ),

              if (showError) ...[
                const SizedBox(height: 10),
                const Text(
                  "Oops! The Verification Code you entered is incorrect.",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],

              const SizedBox(height: 10),

              Row(
                children: [
                  const Text(
                    "Didn't receive the code?",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: seconds == 0
                        ? () {
                            setState(() {
                              seconds = 15;
                              startTimer();
                              pinController.clear();
                            });
                          }
                        : null,
                    child: Text(
                      seconds == 0
                          ? "Resend Code"
                          : "Retry in 00:$seconds",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: seconds == 0 ? Colors.blue : Colors.black,
                      ),
                    ),
                  )
                ],
              ),

              const Spacer(),

              CustomButton(
                text: "Continue",
onPressed: () {
  if (isValidLength) {
    Navigator.pushNamed(context, "/createPasscode");
  } 
  
  else{
    null;
  }
  // else {
  //   setState(() {
  //     showError = true;
  //   });
  // }
},
),


              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

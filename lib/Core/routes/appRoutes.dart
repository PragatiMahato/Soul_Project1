import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/ForgetPin/forgetPasscodeScree.dart';
import 'package:soul_project/Presentations/Screens/Home/homePage.dart';
import 'package:soul_project/Presentations/Screens/Home/qr_code.dart';
import 'package:soul_project/Presentations/Screens/Home/settingScreen.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/facelockscreen.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/fingerprintScreen.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/notification.dart';
import 'package:soul_project/Presentations/Screens/Passcode/createPasscode.dart';
import 'package:soul_project/Presentations/Screens/SignUp/emailScreen.dart';
import 'package:soul_project/Presentations/Screens/SignUp/verificationScreen.dart';
import 'package:soul_project/Presentations/Screens/Walkthrough/onbording_screen.dart';
import 'package:soul_project/Presentations/Screens/Walkthrough/splash_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String onboarding = "/onboarding";
  static const String emailScreen = "/emailScreen";
  static const String verificationScreen = "/verificationScreen";
  static const String createPasscode = "/createPasscode";
  static const String forgotPasscode = "/forgotPasscode";
  static const String notificationScreen = "/notificationScreen";
  static const String faceUnlockScreen = "/faceUnlockScreen";
  static const String fingerprintScreen = "/fingerprintScreen";
  static const String homepage = "/homepage";
  static const String myQrCodeScreen = "/myQrCodeScreen";
  static const String settingScreen = "/settingScreen";
  // static const String signupScreen = "/SignupScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnoardingScreen());

      case emailScreen:
        return MaterialPageRoute(builder: (_) => const Emailscreen());

      case verificationScreen:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());

      case createPasscode:
        return MaterialPageRoute(builder: (_) => const CreatePasscodeScreen());

      case forgotPasscode:
        return MaterialPageRoute(builder: (_) => const ForgotPasscodeScreen());

      case notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      case faceUnlockScreen:
        return MaterialPageRoute(builder: (_) => const FaceUnlockScreen());

      case fingerprintScreen:
        return MaterialPageRoute(builder: (_) => const FingerprintScreen());
      case homepage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case myQrCodeScreen:
        return MaterialPageRoute(builder: (_) => const MyQrCodeScreen());
      
      case settingScreen:
        return MaterialPageRoute(builder: (_) => const Settingscreen());

      // case signupScreen:
      //   return MaterialPageRoute(builder: (_) => const SignupScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route found", style: TextStyle(fontSize: 18)),
            ),
          ),
        );
    }
  }
}

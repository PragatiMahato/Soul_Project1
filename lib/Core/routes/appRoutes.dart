import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/ForgetPin/forgetPasscodeScree.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/notification.dart';
import 'package:soul_project/Presentations/Screens/Passcode/createPasscode.dart';
import 'package:soul_project/Presentations/Screens/SignUp/emailScreen.dart';
import 'package:soul_project/Presentations/Screens/SignUp/verificationScreen.dart';
import 'package:soul_project/Presentations/Screens/Walkthrough/onbording_screen.dart';
import 'package:soul_project/Presentations/Screens/Walkthrough/splash_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String onboarding = "/onboarding";
  static const String  emailScreen= "/emailScreen"; 
  static const String verificationScreen = "/verificationScreen";
   static const String createPasscode = "/createPasscode";
   static const String forgotPasscode = "/forgotPasscode";
     static const String notificationScreen = "/notificationScreen";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnoardingScreen(),
        );

      case emailScreen:
        return MaterialPageRoute(
          builder: (_) => const Emailscreen(),
        );

        case verificationScreen:
        return MaterialPageRoute(
          builder: (_) => const VerificationScreen(),
        );

        case createPasscode:
        return MaterialPageRoute(
          builder: (_) => const CreatePasscodeScreen(),
        );

         case forgotPasscode:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasscodeScreen(),
        );

         case notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );

    

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                "No route found",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
    }
  }
}

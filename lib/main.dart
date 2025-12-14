import 'package:flutter/material.dart';
import 'package:soul_project/Core/routes/appRoutes.dart';
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


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();   

//   runApp(
//     // MultiProvider(
//       // providers: [
//       //   ChangeNotifierProvider(create: (_) => AuthProvider()), 
//       // ],
//       const MyApp(),
//     // ),
//   );
// }

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: "/splash",
       onGenerateRoute: AppRoutes.generateRoute,

      routes: {
        "/splash": (_) => const SplashScreen(),
        "/onboarding": (_) => const OnoardingScreen(),
        "/emailScreen": (_) => const Emailscreen(),
        "/verificationScreen": (_) => const VerificationScreen(),
        "/createPasscode": (_) => const CreatePasscodeScreen(),
        "/forgotPasscode": (_) => const ForgotPasscodeScreen(),
        "/notificationScreen": (_) => const NotificationScreen(),
        "/faceUnlockScreen" : (_) => const FaceUnlockScreen(),
        "/fingerprintScreen" : (_) => const FingerprintScreen(),
        "/homepage" : (_) => const HomePage(),
        "/myQrCodeScreen" : (_) =>  MyQrCodeScreen(),
        '/settingScreen': (context) => const SettingScreen(),
      },
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      
    );
  }
}


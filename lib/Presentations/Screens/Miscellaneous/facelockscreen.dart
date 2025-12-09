import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/enabileNotificationWidget.dart';

class FaceUnlockScreen extends StatelessWidget {
  const FaceUnlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EnableFeatureScreen(
      title: "Setup the Face Unlock for login purpose",
      subtitle: "This will ensure that the app will only be accessible by you.",
      mainImage: "assets/images/facelock.png",
      buttonText: "Enable Face Unlock",
      onEnableTap: () {
         Navigator.pushNamed(context, "/fingerprintScreen");
      },
      onMaybeLater: () {},
    );
  }
}

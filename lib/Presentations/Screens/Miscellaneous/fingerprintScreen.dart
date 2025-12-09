import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/enabileNotificationWidget.dart';

class FingerprintScreen extends StatelessWidget {
  const FingerprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EnableFeatureScreen(
      title: "Setup the Fingerprint unlock",
      subtitle: "This will ensure that the app will only be accessible by you.",
      mainImage: "assets/images/fingerprint.png",
      buttonText: "Enable Fingerprint",
      onEnableTap: () {
         Navigator.pushNamed(context, "/homepage");
      },
      onMaybeLater: () {},
    );
  }
}

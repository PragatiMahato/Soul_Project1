import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/preference.dart';
import 'widget/enabileNotificationWidget.dart';


class FingerprintScreen extends StatelessWidget {
  final String userId;

  const FingerprintScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return EnableFeatureScreen(
      title: "Setup the Fingerprint unlock",
      subtitle: "This will ensure that the app will only be accessible by you.",
      mainImage: "assets/images/fingerprint.png",
      buttonText: "Enable Fingerprint",
      onEnableTap: () async {
        await FeaturePreference.setFingerprint(userId, true);
        Navigator.pop(context);
      },
      onMaybeLater: () async {
        await FeaturePreference.setFingerprint(userId, false);
        Navigator.pop(context);
      },
    );
  }
}

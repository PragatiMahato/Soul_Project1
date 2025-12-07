import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/enabileNotificationWidget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EnableFeatureScreen(
      title: "Stay in the know with instant notification",
      subtitle: "Get informed at the right time to make the most of your Learno account.",
      mainImage: "assets/images/notification.png",
      buttonText: "Enable Notification",
      onEnableTap: () {},
      onMaybeLater: () {},
    );
  }
}

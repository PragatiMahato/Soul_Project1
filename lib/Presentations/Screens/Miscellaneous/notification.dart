import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/enable.dart';
import 'widget/enabileNotificationWidget.dart';
import 'widget/notification_permission.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    if (await NotificationPermissionService.isEnabled()) {
     // Do nothing, only close the prompt

    }
  });
}

  @override
  Widget build(BuildContext context) {
    return EnableFeatureScreen(
      title: "Stay in the know with instant notification",
      subtitle:
          "Get informed at the right time to make the most of your Learno account.",
      mainImage: "assets/images/notification.png",
      buttonText: "Enable Notification",
    // NotificationScreen.dart
onEnableTap: () async {
  final granted = await NotificationPermissionService.request();
  if (!granted) {
    await NotificationPermissionService.openSettings();
  }
  Navigator.pop(context); // return to flow
},

onMaybeLater: () {
  Navigator.pop(context); // skip notifications
}




    );
  }
}

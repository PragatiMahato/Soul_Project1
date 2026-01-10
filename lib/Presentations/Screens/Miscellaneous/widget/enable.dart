import 'package:flutter/material.dart';
import 'notification_permission.dart'; 


Future<void> handleNotificationFlow(BuildContext context) async {
  bool isEnabled = await NotificationPermissionService.isEnabled();

  if (!isEnabled) {

    final granted = await NotificationPermissionService.request();

    if (!granted) {

      await NotificationPermissionService.openSettings();
    }


    isEnabled = await NotificationPermissionService.isEnabled();
  }


  if (isEnabled) {
    Navigator.pushReplacementNamed(context, "/faceUnlockScreen");
  } else {

    Navigator.pushReplacementNamed(context, "/faceUnlockScreen");
  }
}

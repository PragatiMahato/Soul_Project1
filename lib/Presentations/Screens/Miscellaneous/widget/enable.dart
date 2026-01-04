import 'package:flutter/material.dart';
import 'notification_permission.dart'; // Make sure the path is correct

/// Handles notification permission flow.
/// Checks, requests, opens settings if denied, and navigates accordingly.
Future<void> handleNotificationFlow(BuildContext context) async {
  bool isEnabled = await NotificationPermissionService.isEnabled();

  if (!isEnabled) {
    // Ask user to enable notifications
    final granted = await NotificationPermissionService.request();

    if (!granted) {
      // Open system settings for permanently denied
      await NotificationPermissionService.openSettings();
    }

    // After user action, check again
    isEnabled = await NotificationPermissionService.isEnabled();
  }

  // Navigate accordingly
  if (isEnabled) {
    Navigator.pushReplacementNamed(context, "/faceUnlockScreen");
  } else {
    // Optional: show a message or just proceed
    Navigator.pushReplacementNamed(context, "/faceUnlockScreen");
  }
}

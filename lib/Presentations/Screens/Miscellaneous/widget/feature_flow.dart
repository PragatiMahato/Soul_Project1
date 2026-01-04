import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/facelockscreen.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/fingerprintScreen.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/notification.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/preference.dart';
import 'notification_permission.dart';


Future<void> runFeatureFlow(BuildContext context, String userId) async {
  // 1️⃣ Notifications
  final notificationsEnabled = await NotificationPermissionService.isEnabled();
  if (!notificationsEnabled) {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NotificationScreen()),
    );
  }

  // 2️⃣ Face Unlock
//   final faceUnlockEnabled = await FeaturePreference.isFaceUnlockEnabled(userId);
//   if (!faceUnlockEnabled) {
//    await Navigator.push(
//   context,
//   MaterialPageRoute(builder: (_) => FaceUnlockScreen(userId: userId)),
// );

//   }

  // 3️⃣ Fingerprint
//   final fingerprintEnabled = await FeaturePreference.isFingerprintEnabled(userId);
//   if (!fingerprintEnabled) {
//     await Navigator.push(
//   context,
//   MaterialPageRoute(builder: (_) => FingerprintScreen(userId: userId)),
// );
//   }

  // 4️⃣ Homepage
  Navigator.pushReplacementNamed(context, "/homepage");
}

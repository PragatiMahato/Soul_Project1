import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class NotificationPermissionService {
  static Future<bool> isEnabled() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final status = await Permission.notification.status;
      return status.isGranted;
    }
    return true;
  }

  static Future<bool> request() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final status = await Permission.notification.request();
      return status.isGranted;
    }
    return true;
  }

  static Future<void> openSettings() async {
    await openAppSettings();
  }
}

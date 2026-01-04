import 'package:shared_preferences/shared_preferences.dart';

class FeaturePreference {
  static String _faceUnlockKey(String userId) => 'face_unlock_$userId';
  static String _fingerprintKey(String userId) => 'fingerprint_$userId';

  static Future<void> setFaceUnlock(String userId, bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_faceUnlockKey(userId), enabled); // expects bool
  }

  static Future<bool> isFaceUnlockEnabled(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_faceUnlockKey(userId)) ?? false;
  }

  static Future<void> setFingerprint(String userId, bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_fingerprintKey(userId), enabled); // expects bool
  }

  static Future<bool> isFingerprintEnabled(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_fingerprintKey(userId)) ?? false;
  }
}

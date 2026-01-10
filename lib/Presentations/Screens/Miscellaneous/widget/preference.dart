import 'package:shared_preferences/shared_preferences.dart';

class FeaturePreference {
  // Keys for storing preferences
  static String _faceUnlockKey(String userId) => 'face_unlock_$userId';
  static String _fingerprintKey(String userId) => 'fingerprint_$userId';

  /// Save Face Unlock preference
  static Future<void> setFaceUnlock(String userId, bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_faceUnlockKey(userId), enabled); 
  }

  /// Get Face Unlock preference
  static Future<bool> isFaceUnlockEnabled(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_faceUnlockKey(userId)) ?? false;
  }

  /// Save Fingerprint preference
  static Future<void> setFingerprint(String userId, bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_fingerprintKey(userId), enabled); 
  }

  /// Get Fingerprint preference
  static Future<bool> isFingerprintEnabled(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_fingerprintKey(userId)) ?? false;
  }
}

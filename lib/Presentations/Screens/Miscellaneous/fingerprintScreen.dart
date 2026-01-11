import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/preference.dart';
import 'widget/enabileNotificationWidget.dart';

class FingerprintScreen extends StatefulWidget {
  final String userId;

  const FingerprintScreen({super.key, required this.userId});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen>
    with WidgetsBindingObserver {
  final LocalAuthentication _auth = LocalAuthentication();
  bool _isAuthenticating = false;
  bool _biometricEnabled = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadBiometricPreference();
    _authenticateIfEnabled();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _authenticateIfEnabled();
    }
  }

  Future<void> _loadBiometricPreference() async {
    bool enabled = await FeaturePreference.isFingerprintEnabled(widget.userId);
    setState(() {
      _biometricEnabled = enabled;
    });
  }

  Future<void> _authenticateIfEnabled() async {
    if (!_biometricEnabled) return;

    try {
      setState(() => _isAuthenticating = true);

      final bool authenticated = await _auth.authenticate(
        localizedReason: 'Authenticate to access the app',
        biometricOnly: true,
      );

      setState(() {
        _isAuthenticating = false;
      });

      if (!authenticated) {
        SystemNavigator.pop();
      }
    } on PlatformException catch (e) {
      setState(() => _isAuthenticating = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Authentication failed')),
      );
      SystemNavigator.pop();
    }
  }

  Future<void> _enableBiometric(BuildContext context) async {
    try {
      setState(() => _isAuthenticating = true);

      final bool authenticated = await _auth.authenticate(
        localizedReason: 'Authenticate to enable biometric unlock',
        biometricOnly: true,
      );

      setState(() => _isAuthenticating = false);

      if (authenticated) {
        await FeaturePreference.setFingerprint(widget.userId, true);
        setState(() => _biometricEnabled = true);
        Navigator.pop(context);
      }
    } on PlatformException catch (e) {
      setState(() => _isAuthenticating = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Authentication failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return EnableFeatureScreen(
      title: "Setup Biometric Unlock",
      subtitle: "This will ensure that the app is only accessible by you.",
      mainImage: "assets/images/fingerprint.png",
      buttonText: _isAuthenticating ? "Authenticating..." : "Enable Biometric",
      onEnableTap: _isAuthenticating
          ? () {}
          : () => _enableBiometric(context),
      onMaybeLater: () async {
        await FeaturePreference.setFingerprint(widget.userId, false);
        setState(() => _biometricEnabled = false);
        Navigator.pop(context);
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/preference.dart' show FeaturePreference;


class BiometricGate extends StatefulWidget {
  final Widget child;
  final String userId;
  const BiometricGate({super.key, required this.child, required this.userId});

  @override
  State<BiometricGate> createState() => _BiometricGateState();
}

class _BiometricGateState extends State<BiometricGate> {
  final LocalAuthentication _auth = LocalAuthentication();
  bool _authenticated = false;
  bool _enabled = false;

  @override
  void initState() {
    super.initState();
    _checkFingerprintEnabled();
  }

  Future<void> _checkFingerprintEnabled() async {
    _enabled = await FeaturePreference.isFingerprintEnabled(widget.userId);
    if (_enabled) {
      await _authenticate();
    } else {
      setState(() {
        _authenticated = true; 
      });
    }
  }

  Future<void> _authenticate() async {
    final bool authenticated = await _auth.authenticate(
      localizedReason: 'Authenticate to access the app',
      biometricOnly: true,
    );

    if (!mounted) return;

    setState(() {
      _authenticated = authenticated;
    });

    if (!authenticated) {
      SystemNavigator.pop(); // exit app if failed
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_authenticated) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return widget.child; 
  }
}

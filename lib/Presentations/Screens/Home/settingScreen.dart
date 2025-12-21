// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';
import 'package:soul_project/Presentations/Screens/Home/weidget/connectWallet_dialog.dart';
import 'package:soul_project/Presentations/Screens/Home/weidget/deleteaccount_dialogbox.dart';
import 'package:soul_project/Presentations/Screens/Home/weidget/logout_dialogbar.dart';
import 'package:soul_project/Presentations/Screens/Home/weidget/network_dialogbox.dart';
import 'package:soul_project/Presentations/Screens/Home/weidget/privacyPolicy.dart';
import 'package:soul_project/Presentations/Screens/Home/weidget/userAgrement.dart';
import 'package:soul_project/Presentations/Screens/Walkthrough/onbording_screen.dart';
import 'package:soul_project/services/authService.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
final AuthService _authService = AuthService();

 User? _currentUser; 

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser; // get current user
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: ListView(
            children: [
              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.grey.shade400,
                  child: Icon(
                    Icons.person_2_outlined,
                    size: 48,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              const SizedBox(height: 12),

               Center(
                child: Text(
                  _currentUser?.email ?? "No email",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 6),

              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.copy, size: 14),
                      SizedBox(width: 6),
                      Text("232FDSKJHFD3...", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              _tile(
  icon: Icons.language,
  title: "Choose Network",
  subtitle: "Polygon",
  onTap: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ChooseNetworkDialog(),
    );
  },
),

           _tile(
  icon: Icons.account_balance_wallet_outlined,
  title: "Connect Wallet",
  subtitle: "Not Connected",
  onTap: () {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const ConnectWalletSheet(),
    );
  },
),

              // const SizedBox(height: 16),
              // _section("Preference"),

              // SettingSwitchTile(title: "Enable Face Unlock", icon: Icons.face),

              // SettingSwitchTile(
              //   title: "Enable Fingerprint",
              //   icon: Icons.fingerprint,
              // ),

              // _tile(icon: Icons.lock, title: "Change Passcode", onTap: () {}),

              const SizedBox(height: 16),
              _section("Resources"),

              _tile(
  icon: Icons.people,
  title: "User Agreement",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const UserAgreementPage()),
    );
  },
),
              _tile(
  icon: Icons.description,
  title: "Privacy Policy",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PrivacyPolicyPage()),
    );
  },
),
              _tile(
                icon: Icons.phone_android,
                title: "Contact Us",
                subtitle: "support@soul.app",
                onTap: () {},
              ),
              _tile(icon: Icons.favorite, title: "Follow Us", onTap: () {}),

              const SizedBox(height: 16),
              _section("Danger Zone"),
_tile(
  icon: Icons.delete,
  title: "Delete your Account",
  onTap: () {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => DeleteAccountDialog(
        onConfirm: () async {
          Navigator.pop(context); 

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          );

          try {
            await FirebaseAuth.instance.currentUser!.delete();

            Navigator.pop(context); 

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const OnoardingScreen(),
              ),
              (_) => false,
            );
          } on FirebaseAuthException catch (e) {
            Navigator.pop(context);

            final msg = e.code == 'requires-recent-login'
                ? "Please sign in again to delete your account."
                : e.message ?? "Delete failed";

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg)),
            );
          } catch (e) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Delete failed: $e")),
            );
          }
        },
      ),
    );
  },
),


          _tile(
  icon: Icons.logout,
  title: "Log Out",
  onTap: () {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => LogoutDialog(
        onConfirm: () async {
          Navigator.pop(context);

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          );

          try {
            await _authService.signOut();
            Navigator.pop(context); 

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const OnoardingScreen(),
              ),
              (_) => false,
            );
          } catch (e) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Sign out failed: $e")),
            );
          }
        },
      ),
    );
  },
),


              const SizedBox(height: 32),

              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE5E5EA),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/images/Vector.png'),
                    ),
                  ),

                  const SizedBox(height: 6),
                  const Text(
                    "Soul",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.bodyText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Version 1.0.0 (200)",
                    style: TextStyle(fontSize: 12, color: AppColors.bodyText),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(title, style: AppStyle.heading4),
    );
  }

static Widget _tile({
  required IconData icon,
  required String title,
  String? subtitle,
  VoidCallback? onTap,
}) {
  return Material(
    color: Colors.transparent, 
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      splashColor: AppColors.bodyText.withOpacity(0.12),
      highlightColor: AppColors.bodyText.withOpacity(0.06),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          contentPadding: EdgeInsets.zero,

          leading: Icon(
            icon,
            size: 24,
            color: AppColors.bodyText,
          ),

          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle) : null,

          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: AppColors.bodyText,
          ),
        ),
      ),
    ),
  );
}


}

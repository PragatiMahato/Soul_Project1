import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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

              const Center(
                child: Text(
                  "john.doe@gmail.com",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.copy, size: 14),
                      SizedBox(width: 6),
                      Text(
                        "232FDSKJHFD3...",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              _tile(
                icon: Icons.language,
                title: "Choose Network",
                subtitle: "Polygon",
              ),
              _tile(
                icon: Icons.account_balance_wallet_outlined,
                title: "Connect Wallet",
                subtitle: "Not Connected",
              ),

              const SizedBox(height: 16),
              _section("Preference"),

          _switchTile(
  title: "Enable Face Unlock",
  icon: Icons.face,
),

_switchTile(
  title: "Enable Fingerprint",
  icon: Icons.fingerprint,
),

              _tile(
                icon: Icons.lock_outline,
                title: "Change Passcode",
              ),

              const SizedBox(height: 16),
              _section("Resources"),

              _tile(icon: Icons.group_outlined, title: "User Agreement"),
              _tile(icon: Icons.privacy_tip, title: "Privacy Policy"),
              _tile(
                icon: Icons.phone_android,
                title: "Contact Us",
                subtitle: "support@soul.app",
              ),
              _tile(icon: Icons.favorite, title: "Follow Us"),

              const SizedBox(height: 16),
              _section("Danger Zone"),

              _tile(
                icon: Icons.delete,
                title: "Delete your Account",
              ),
              _tile(
                icon: Icons.logout,
                title: "Log Out",
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
  child:  Padding(
    padding: const EdgeInsets.all(8),
    child: Image.asset('assets/images/Vector.png'),
  ),
),

                  const SizedBox(height: 6),
                  const Text(
                    "Soul",
                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: AppColors.bodyText),
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
      child: Text(
        title,
        style: AppStyle.heading4
      ),
    );
  }

  static Widget _tile({
    required IconData icon,
    required String title,
    String? subtitle,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  static Widget _switchTile({
  required String title,
  required IconData icon,
}) {
  return SwitchListTile(
    contentPadding: EdgeInsets.zero,
    value: false,
    onChanged: (v) {},
    title: Text(title),
    secondary: Icon(icon, color: AppColors.bodyText,), 
  );
}

}

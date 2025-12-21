import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';
import 'package:soul_project/Presentations/Screens/Home/settingScreen.dart';
import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/enabileNotificationWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showFeaturePopups();
    });
  }

  void _showFeaturePopups() {
    _showNotificationPopup();
  }

  void _showNotificationPopup() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: EnableFeatureScreen(
            title: "Stay in the know with instant notification",
            subtitle:
                "Get informed at the right time to make the most of your Learno account.",
            mainImage: "assets/images/notification.png",
            buttonText: "Enable Notification",
            onEnableTap: () {
              Navigator.pop(context);
              _showFaceUnlockPopup();
            },
            onMaybeLater: () {
              Navigator.pop(context);
              _showFaceUnlockPopup();
            },
          ),
        );
      },
    );
  }

  void _showFaceUnlockPopup() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: EnableFeatureScreen(
            title: "Setup the Face Unlock for login purpose",
            subtitle:
                "This will ensure that the app will only be accessible by you.",
            mainImage: "assets/images/facelock.png",
            buttonText: "Enable Face Unlock",
            onEnableTap: () {
              Navigator.pop(context);
              _showFingerprintPopup();
            },
            onMaybeLater: () {
              Navigator.pop(context);
              _showFingerprintPopup();
            },
          ),
        );
      },
    );
  }

  void _showFingerprintPopup() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: EnableFeatureScreen(
            title: "Setup the Fingerprint unlock",
            subtitle:
                "This will ensure that the app will only be accessible by you.",
            mainImage: "assets/images/fingerprint.png",
            buttonText: "Enable Fingerprint",
            onEnableTap: () {
              Navigator.pop(context);
            },
            onMaybeLater: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Home", style: AppStyle.heading1),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.qr_code_outlined,
                          size: 24,
                          color: AppColors.bodyText,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/myQrCodeScreen");
                        },
                      ),

                      const SizedBox(width: 14),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 24,
                          color: AppColors.bodyText,
                        ),
                      ),

                      const SizedBox(width: 14),

                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Settingscreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.settings,
                          size: 24,
                          color: AppColors.bodyText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 115, 114, 114),
                      Color(0xFF3A3A3A),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 115, 114, 114),
                            Color(0xFF3A3A3A),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black,
                            blurRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.face_6,
                          size: 85,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Proof of Soul",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "This shows you're a real & unique human — while keeping you anonymous and your data private.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.greyButton,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          141,
                          136,
                          104,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Verify Now",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text("Application and Services", style: AppStyle.smallText),

              const SizedBox(height: 15),

              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 15,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
                children: [
                  _appIcon("assets/images/x.png", "X"),
                  _appIcon("assets/images/discord.png", "Discord"),
                  _appIcon("assets/images/robinhod.png", "Robinhood"),
                  _appIcon("assets/images/metamask.png", "Metamask"),
                  _appIcon("assets/images/binance.png", "Binance"),
                  _appIcon("assets/images/cashapp.png", "Cash App"),
                  _appIcon("assets/images/dollorapp.png", "Ethereum"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appIcon(String imgPath, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            height: 108.5,
            width: 86.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                imgPath,
                height: 86,
                width: 86,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        Text(
          title,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

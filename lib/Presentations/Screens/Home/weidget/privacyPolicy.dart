import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';


class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.white,
      appBar: AppBar(
         title: const Text(
    "Privacy Policy",
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  centerTitle: true,
  elevation: 0,backgroundColor: AppColors.white,
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Soul (“we,” “our,” “us”) values your privacy and is committed "
              "to protecting it. This Privacy Policy explains how we handle "
              "your data when you use our decentralized identity platform "
              "powered by Zero-Knowledge Proof (ZKP) technology.",
              style: TextStyle(height: 1.5), textAlign: TextAlign.justify,
            ),

            SizedBox(height: 24),

            _SectionTitle("Core Principles"),
            _Bullet("User Control – You own and control your identity credentials."),
            _Bullet("Data Minimization – We collect as little personal data as possible."),
            _Bullet("Decentralization – Your data resides with you, not on our servers."),
            _Bullet("Transparency – We clearly explain what we collect and how it’s used."),

            SizedBox(height: 24),

            _SectionTitle("What We Do Not Collect"),
             SizedBox(height: 10),
            Text("Soul does not:"),
 SizedBox(height: 5),
            _Bullet("Store or have access to your private keys, seed phrases, or identity credentials."),
            _Bullet("Sell, rent, or trade your personal data."),
            _Bullet(
              "Collect sensitive personal identifiers unless explicitly provided "
              "by you for verification purposes.",
            ),

            SizedBox(height: 24),

            _SectionTitle("Zero-Knowledge Proofs & Privacy"),
            _Bullet(
              "ZKP technology allows you to prove facts (e.g., “I am over 18”) "
              "without revealing the underlying data (e.g., your birthdate).",
            ),
            _Bullet(
              "Only the proofs you voluntarily generate and share are visible to verifiers.",
            ),

            SizedBox(height: 24),

            _SectionTitle("What We May Collect"),
            _Bullet(
              "Wallet Information – Public blockchain addresses or DID identifiers "
              "you connect.",
            ),
            _Bullet(
              "Usage Data – Non-identifiable metadata such as device type, logs, "
              "or interaction history (for debugging and analytics).",
            ),
            _Bullet(
              "Voluntary Data – Information you choose to share with verifiers "
              "or third parties through the Platform (e.g., proof of age, "
              "proof of membership).",
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", textAlign: TextAlign.justify,) ,
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';

class UserAgreementPage extends StatelessWidget {
  const UserAgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          "User Agreement",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Soul User Agreement",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              "Last Updated: 18 September, 2025",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 16),

            Text(
              "Welcome to Soul (“Platform”), a decentralized identity platform "
              "powered by Zero-Knowledge Proof (ZKP) technology. By accessing "
              "or using Soul, you (“User,” “you”) agree to the following terms "
              "and conditions. Please read them carefully.",
              style: TextStyle(height: 1.5,),textAlign: TextAlign.justify,
            ),

            SizedBox(height: 16),

            Text(
              "By creating an account, connecting your wallet, or otherwise "
              "using Soul, you agree to this User Agreement and our Privacy "
              "Policy. If you do not agree, do not use the Platform.",
              style: TextStyle(height: 1.5),textAlign: TextAlign.justify,
            ),

            SizedBox(height: 24),

            _SectionTitle("Eligibility"),
            _Bullet(
              "You must be at least 18 years old or the legal age of majority "
              "in your jurisdiction.",
            ),
            _Bullet(
              "You are solely responsible for complying with local laws, "
              "including identity, data protection, and digital asset "
              "regulations.",
            ),

            SizedBox(height: 24),

            _SectionTitle("Decentralized Identity & Zero-Knowledge Proofs"),
            _Bullet(
              "Soul enables you to create, control, and verify your "
              "decentralized identity (DID) without revealing unnecessary "
              "personal information.",
            ),
            _Bullet(
              "ZKP technology allows you to prove statements (e.g., “I am over 18”) "
              "without disclosing underlying data.",
            ),
            _Bullet(
              "You remain the sole owner and controller of your identity "
              "credentials.",
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
          const Text("• ", textAlign: TextAlign.justify,),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
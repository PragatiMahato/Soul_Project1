import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appStyles.dart';
import 'package:soul_project/Presentations/Widgets/customButton.dart';

class EnableFeatureScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainImage;
  final String buttonText;
  final VoidCallback onEnableTap;
  final VoidCallback onMaybeLater;

  const EnableFeatureScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.mainImage,
    required this.buttonText,
    required this.onEnableTap,
    required this.onMaybeLater,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white, 
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, size: 28),
                onPressed: onMaybeLater,
              ),
            ),

            const SizedBox(height: 20),

            Text(title, style: AppStyle.heading1),
            const SizedBox(height: 12),
            Text(subtitle, style: AppStyle.smallText, ),

            const SizedBox(height: 40),

            Center(
              child: Image.asset(
                mainImage,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onEnableTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 12),

            CustomButton(
              onPressed: onMaybeLater,
              text: "Maybe Later",
            ),
          ],
        ),
      ),
    );
  }
}

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              IconButton(
                icon: const Icon(Icons.close, size: 26),
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: 10),


              Text(
                title,
                style: AppStyle.heading1
              ),

              const SizedBox(height: 8),


              Text(
                subtitle,
                style: AppStyle.smallText
              ),

              const SizedBox(height: 40),


              Center(
                child: Image.asset(
                  mainImage,
                  height: 309,
                  width: 526,fit: BoxFit.cover,
                ),
              ),

              const Spacer(),

  
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: onEnableTap,
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.black,
              //       padding: const EdgeInsets.symmetric(vertical: 16),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(14),
              //       ),
              //     ),
              //     child: Text(
              //       buttonText,
              //       style: const TextStyle(
              //         fontSize: 16,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),

              CustomButton(
                onPressed: onMaybeLater,
                 text: 
                  buttonText,
                  
                  
                
              ),

              const SizedBox(height: 14),


              CustomButton(
                onPressed: onMaybeLater,
                 text: 
                  "Maybe Later",
                  
                
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  // final Color? btnColor;
  // final Color? txtColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    //  this.btnColor,  this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;
    return SizedBox(
      width: 370,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppColors.greyButton : AppColors.black,
          elevation: 0,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(222),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: isEnabled ? AppColors.black : AppColors.black,
            fontSize: 16,
            letterSpacing: -0.5,
            height: 1.3,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

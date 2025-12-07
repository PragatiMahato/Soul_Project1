import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key,required this.hint,
    this.controller,
    this.keyboardType,
    this.onChanged,});

  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 370,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        cursorColor: AppColors.black,
        style: AppStyle.inputText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppStyle.inputHint,
          contentPadding: const EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.bodyText, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.black, width: 1),
          ),
          filled: true,
          fillColor: AppColors.white
        ),
      
      ),
    );
  }
}
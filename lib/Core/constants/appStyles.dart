import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';


class AppStyle {


  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: "Outfit",
    height: 1.214,
    letterSpacing: -1,
    
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: "Outfit"
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: "Outfit"
  );

  static const TextStyle smallText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.bodyText,
    height: 1.3,
    letterSpacing: -0.5,
    fontFamily: "Outfit"
    
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: "Outfit"
  );



  static const TextStyle inputHint = TextStyle(
    fontSize: 17,
    color: Color.fromARGB(255, 181, 181, 181),
    fontWeight: FontWeight.w400,
    letterSpacing: -0.5,
  );

  static const TextStyle inputText = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
  );



 
}

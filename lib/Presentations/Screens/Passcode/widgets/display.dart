import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';

class PassCodeDisplay extends StatelessWidget {
  const PassCodeDisplay({super.key, required this.length, required this.filled});

  final int length;
  final int filled;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length, 
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
             border: Border.all(
              color:
                  index == filled ? AppColors.black : AppColors.greyButton,
              width: 1.5,
            ),
            color: AppColors.white
          ),
          child: Center(
            child: filled > index
                ? Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                    ),
                  )
                  : null,

          ),
        ))
    );
  }
}
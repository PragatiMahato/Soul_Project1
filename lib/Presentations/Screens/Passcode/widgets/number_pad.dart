import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({super.key, required this.onDigitPress, required this.onDeletePress});

    final Function(String) onDigitPress;
  final VoidCallback onDeletePress;

  @override
  Widget build(BuildContext context) {

    final numbers = [
      "1","2","3",
      "4","5","6",
      "7","8","9",
      "","0","del",
    ];

    return  Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 80),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: numbers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
        ),  itemBuilder: (context, index) {
          final value = numbers[index];

          if (value == "") {
            return const SizedBox(); 
          }
           return GestureDetector(
            onTap: () {
              if (value == "del") {
                onDeletePress();
              } else {
                onDigitPress(value);
              }
            },
            child: Center(
              child: value == "del"
                  ? Icon(Icons.backspace_outlined,
                      size: 26, color: AppColors.black)
                  : Text(
                      value,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';

class RectangularHalfButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedFunction;
  final Color? bgColor;
  const RectangularHalfButton(
      {super.key,
      required this.buttonText,
      required this.onPressedFunction,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressedFunction,
      child: Container(
        width: (CommonFunction.getActualWidth(context) - 100) / 2,
        height: 35.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: bgColor ?? AppColor.blue,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextstyle.ts18WR,
          ),
        ),
      ),
    );
  }
}

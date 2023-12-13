import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTapFunction;
  final bool isDisable;
  final bool isHalf;
  final Color? color;
  const CustomButton(
      {super.key,
      required this.title,
      required this.onTapFunction,
      this.isDisable = false,
      this.isHalf = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        width: isHalf
            ? (CommonFunction.getActualWidth(context) - 30.0) / 2
            : CommonFunction.getActualWidth(context) - 20.0,
        decoration: BoxDecoration(
          gradient: color != null
              ? null
              : isDisable
                  ? LinearGradient(
                      colors: [AppColor.grey, AppColor.grey],
                    )
                  : AppColor.gradientColor,
          color: color,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              title,
              style: AppTextstyle.ts16BM.copyWith(color: AppColor.white),
            ),
          ),
        ),
      ),
    );
  }
}

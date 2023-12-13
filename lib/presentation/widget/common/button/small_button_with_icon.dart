import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';

class SmallButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final VoidCallback onPressedFunction;
  final double? width;
  final Color? color;
  const SmallButtonWithIcon(
      {super.key,
      required this.buttonText,
      required this.onPressedFunction,
      this.width,
      this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color ??  AppColor.blue,
      ),
      child: SizedBox(
        width: width ?? (CommonFunction.getActualWidth(context) - 40) / 2,
        height: 45.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ??  AppColor.blue,
          ),
          onPressed: onPressedFunction,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 25.0,
              ),
              const SizedBox(width: 5.0),
              Text(
                buttonText,
                style: AppTextstyle.ts20WM,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

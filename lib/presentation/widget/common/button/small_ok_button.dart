import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/textstyle.dart';

class SmallOkButton extends StatelessWidget {
  final String title;
  final VoidCallback onCallbackFunction;
  final Color? color;
  const SmallOkButton(
      {super.key,
      required this.title,
      required this.onCallbackFunction,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCallbackFunction,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
            color: color ?? AppColor.blue,
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              title,
              style: AppTextstyle.ts16BB.copyWith(color: AppColor.white),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:purchase/common/textstyle.dart';

class CustomLabelText extends StatelessWidget {
  final String title;
  const CustomLabelText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextstyle.ts16BM,
          ),
        ],
      ),
    );
  }
}

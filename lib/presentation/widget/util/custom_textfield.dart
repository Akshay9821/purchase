import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController textController;
  final int maxCharacters;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final String hint;
  final bool readOnly;
  final bool onlyText;
  final TextInputAction? textInputAction;
  final bool isAppliedInputFormatters; // Not required

  const CustomTextField({
    Key? key,
    this.keyboardType,
    required this.textController,
    this.maxCharacters = -1,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    required this.hint,
    this.readOnly = false,
    this.onlyText = false,
    this.textInputAction,
    this.isAppliedInputFormatters = true, // Default value is true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 20.0),
      width: CommonFunction.getActualWidth(context) - 25.0,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: textController,
        inputFormatters: isAppliedInputFormatters
            ? [
                LengthLimitingTextInputFormatter(maxCharacters),
                onlyText
                    ? FilteringTextInputFormatter.allow(RegExp('[A-Za-z]'))
                    : FilteringTextInputFormatter.allow(RegExp('.*')),
              ]
            : null, // Apply inputFormatters conditionally
        obscureText: obscureText,
        readOnly: readOnly,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: AppTextstyle.ts16GR,
          hintText: hint,
          hintStyle: AppTextstyle.ts16GR,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.blue,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.lightGrey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}

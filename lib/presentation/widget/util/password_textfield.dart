import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';

class PasswordTextfield extends StatefulWidget {
  final TextEditingController textController;
  final String hint;

  const PasswordTextfield({
    super.key,
    required this.textController,
    required this.hint,
  });

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: CommonFunction.getActualWidth(context) - 40.0,
      child: TextFormField(
        controller: widget.textController,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: widget.hint,
          labelStyle: AppTextstyle.ts16GR,
          hintText: widget.hint,
          hintStyle: AppTextstyle.ts16GR,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          suffixIcon: obscureText
              ? InkWell(
                  onTap: () {
                    obscureText = false;
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.visibility_off,
                  ),
                )
              : InkWell(
                  onTap: () {
                    obscureText = true;
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.visibility,
                  ),
                ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.blue,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.lightGrey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOTPTextField extends StatelessWidget {
  final TextEditingController textController;
  final double textBoxSize;
  final FocusNode? focusNode;
  final bool readOnly;
  final Function(String) onChanged;
  const CustomOTPTextField({
    super.key,
    required this.textBoxSize,
    required this.onChanged,
    required this.textController,
    this.readOnly = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: min(50, textBoxSize),
      width: min(50, textBoxSize),
      child: TextField(
        controller: textController,
        focusNode: focusNode,
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        readOnly: readOnly,
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

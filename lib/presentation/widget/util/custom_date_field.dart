import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';

class CustomDateField extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime) setValue;
  final bool flag;
  final String hint;
  final double? width;

  const CustomDateField({
    Key? key,
    required this.setValue,
    this.initialDate,
    this.flag = true,
    required this.hint,
    this.width,
  }) : super(key: key);

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  late DateTime date;
  String? finalDate;

  @override
  void initState() {
    super.initState();
    print(widget.initialDate);
    date = widget.initialDate == null ? DateTime.now() : widget.initialDate!;
    if (widget.initialDate != null) {
      finalDate = CommonFunction.formatDateToDDMMYYYY(widget.initialDate!);
    }
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    ).then((value) {
      if (value != null) {
        setState(() {
          finalDate = CommonFunction.formatDateToDDMMYYYY(value);
          widget.setValue(value);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.flag) {
      finalDate = CommonFunction.formatDateToDDMMYYYY(widget.initialDate!);
    }
    return InkWell(
      onTap: () {
        if (widget.flag) {
          _showDatePicker(context);
        }
      },
      child: Container(
        width: (widget.width == null)
            ? CommonFunction.getActualWidth(context) - 25.0
            : widget.width,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: widget.hint,
            labelStyle: AppTextstyle.ts16GR,
            hintText: widget.hint,
            hintStyle: AppTextstyle.ts16GR,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                finalDate == null ? "DD-MM-YYYY" : finalDate!,
                style: finalDate == null
                    ? AppTextstyle.ts16GR
                    : AppTextstyle.ts16BR,
              ),
              Icon(
                Icons.calendar_month_outlined,
                color: AppColor.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

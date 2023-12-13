import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';

class CustomDateForIndend extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime) setValue;
  final bool flag;
  final String hint;
  final double? width;

  const CustomDateForIndend({
    Key? key,
    required this.setValue,
    this.initialDate,
    this.flag = true,
    required this.hint,
    this.width,
  }) : super(key: key);

  @override
  State<CustomDateForIndend> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateForIndend> {
  late DateTime selectedDate;
  late DateTime currentDate;

  @override
  void initState() {
    super.initState();
    print(widget.initialDate);
    currentDate = DateTime.now();
    selectedDate = widget.initialDate ?? currentDate;
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: currentDate.subtract(const Duration(days: 0)),
      lastDate: DateTime(3000),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.setValue(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = CommonFunction.formatDateToDDMMYYYY(selectedDate);

    return GestureDetector(
      onTap: () => _showDatePicker(context),
      child: SizedBox(
        width: (CommonFunction.getActualWidth(context) - 25),
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
            labelText: 'Required By Date*',
            labelStyle: AppTextstyle.ts16BM.copyWith(color: AppColor.blue),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.blue,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.blue),
            ),
            suffixIcon: Icon(Icons.calendar_month, color: AppColor.blue),
          ),
          controller: TextEditingController(
            text: selectedDate == currentDate
                ? CommonFunction.formatDateToDDMMYYYY(currentDate)
                : formattedDate,
          ),
        ),
      ),
    );
  }
}

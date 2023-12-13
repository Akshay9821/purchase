import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';
class CustomTimeField extends StatefulWidget {
  final Function(TimeOfDay) setValue;
  final TimeOfDay? initialTime;
  final String hint;
  const CustomTimeField(
      {Key? key, required this.setValue, this.initialTime, required this.hint})
      : super(key: key);

  @override
  State<CustomTimeField> createState() => _CustomTimeFieldState();
}

class _CustomTimeFieldState extends State<CustomTimeField> {
  late TimeOfDay selectedTime;
  late TimeOfDay currentTime;

  @override
  void initState() {
    super.initState();
    currentTime = TimeOfDay.now();
    selectedTime = widget.initialTime ?? currentTime;
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context));

      setState(() {
        selectedTime = pickedTime;
      });
      widget.setValue(pickedTime);
    } else {
      print("Time is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectTime(context),
      child: Container(
        width: CommonFunction.getActualWidth(context) - 40.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: TextField(
          enabled: false,
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
            suffixIcon: Icon(
              Icons.access_time, // You can replace this with your desired icon
              color: AppColor.blue, // You can customize the color as needed
            ),
          ),
          style: AppTextstyle.ts16BM,
          controller: TextEditingController(
            text: selectedTime == currentTime
                ? currentTime.format(context)
                : selectedTime.format(context),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/textstyle.dart';

class CustomDropdown extends StatefulWidget {
  final Function(dynamic) setValue;
  final List<dynamic> itemList;
  final dynamic initialValue;
  final double width;

  const CustomDropdown({
    Key? key,
    required this.setValue,
    required this.itemList,
    this.width = 0,
    this.initialValue,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late dynamic dropdownvalue;

  @override
  void initState() {
    super.initState();
    dropdownvalue = widget.initialValue ?? widget.itemList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.itemList[0]["DisplayText"],
          labelStyle: AppTextstyle.ts16GR,
          hintText: widget.itemList[0]["DisplayText"],
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
        child: DropdownButton<dynamic>(
          isExpanded: true,
          value: dropdownvalue,
          underline: Container(),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: widget.itemList.map((dynamic items) {
            return DropdownMenuItem(
              value: items,
              child: Text(
                items["DisplayText"],
                style: dropdownvalue["DisplayText"] == items["DisplayText"]
                    ? AppTextstyle.ts16GR
                    : AppTextstyle.ts16GR,
              ),
            );
          }).toList(),
          onChanged: (dynamic newValue) {
            setState(() {
              dropdownvalue = newValue;
              widget.setValue(newValue);
            });
          },
        ),
      ),
    );
  }
}

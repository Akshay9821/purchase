import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/presentation/widget/common/reuseable_widget/custom_appbar_2_widget.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
          child: SizedBox(
        width: CommonFunction.getActualWidth(context),
        height: CommonFunction.getActualHeight(context),
        child: const Column(
          children: [
            CustomAppbar2Widget(
              title: "Vendor",
            ),
          ],
        ),
      )),
    );
  }
}

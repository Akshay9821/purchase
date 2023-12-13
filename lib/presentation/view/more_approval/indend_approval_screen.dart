import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/more_approval/indend_approval_controller.dart';
import 'package:purchase/presentation/widget/common/reuseable_widget/custom_appbar_2_widget.dart';

class IndendApproval extends StatelessWidget {
  const IndendApproval({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IndendApprovalController());
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
          child: SizedBox(
        width: CommonFunction.getActualWidth(context),
        height: CommonFunction.getActualHeight(context),
        child: Column(
          children: [
            const CustomAppbar2Widget(
              title: "Indend Approval",
            ),
            Column(
              children: [
                const SizedBox(height: 20.0),
                Expanded(
                    child: Center(
                  child: Column(
                    children: [
                      Image(
                        image:
                            const AssetImage("assets/images/common/nodata.png"),
                        width: CommonFunction.getWidth(context) - 100,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "No data found !",
                        style: AppTextstyle.ts16BB,
                      ),
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      )),
    );
  }
}

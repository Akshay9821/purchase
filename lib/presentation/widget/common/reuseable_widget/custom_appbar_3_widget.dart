import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/indent/indend_controller.dart';

class CustomAppbar3Widget extends StatelessWidget {
  final String title;
  final VoidCallback onTapFunction;
  const CustomAppbar3Widget(
      {super.key, required this.title, required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IndendController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            children: [
              InkWell(
                onTap: () {
                  // Get.offAllNamed(AppRoute.bottomNavigation);
                },
                child: const Image(
                  image: AssetImage("assets/images/common/logo.png"),
                  width: 30.0,
                  height: 30.0,
                ),
              ),
              const SizedBox(width: 20.0),
              Text(
                title,
                style: AppTextstyle.ts20BM,
              ),
            ],
          ),
          const Spacer(),
          Obx(
            () => controller.showAddMaterialBtn.value
                ? InkWell(
                    onTap: onTapFunction,
                    child: Icon(
                      Icons.add_box_sharp,
                      color: AppColor.blue,
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}

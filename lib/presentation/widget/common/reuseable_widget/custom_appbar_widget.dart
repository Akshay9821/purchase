import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/textstyle.dart';
class CustomAppbarWidget extends StatelessWidget {
  final String title;
  const CustomAppbarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            children: [
              const Image(
                image: AssetImage("assets/images/logo.png"),
                width: 30.0,
                height: 30.0,
              ),
              const SizedBox(width: 20.0),
              Text(
                title,
                style: AppTextstyle.ts24BH,
              ),
            ],
          ),
          Wrap(
            children: [
              InkWell(
                onTap: () {
                  // Get.toNamed(AppRoute.profileView);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: const Image(
                    image: AssetImage("assets/icons/common/profile.png"),
                    height: 30.0,
                    width: 30.0,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              InkWell(
                onTap: (){
                },
                child: const Image(
                  image: AssetImage("assets/icons/common/notification.png"),
                  height: 30.0,
                  width: 30.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

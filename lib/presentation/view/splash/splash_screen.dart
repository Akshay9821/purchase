import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/splash/splash_controller.dart';
import 'package:purchase/presentation/widget/common/button/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return Scaffold(
      body: Obx(
        () => (controller.isUpdate.value)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/common/logo.png"),
                    width: 200.0,
                    height: 100.0,
                  ),
                  Text(
                    "App Update Available!!!",
                    style: AppTextstyle.ts16BB,
                  ),
                  const SizedBox(height: 20.0),
                  CustomButton(
                      title: "VERIFY OTP",
                      onTapFunction: () {
                        controller.launchStore();
                      },
                    )
                ],
              )
            : const Center(
                child: Image(
                  image: AssetImage("assets/images/common/logo.png"),
                  width: 200.0,
                  height: 100.0,
                ),
              ),
      ),
    );
  }
}

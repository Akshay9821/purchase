import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/textstyle.dart';

class DialogHelper {
  // Loader Dialog
  static void showLoader(String title) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Row(
                children: [
                  const Image(
                    image: AssetImage("assets/images/common/logo.png"),
                    width: 25.0,
                    height: 25.0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // Image(
                  //   image: AssetImage("assets/images/common/logo_with_name.png"),
                  //   width: 80.0,
                  //   height: 25.0,
                  // ),
                  Text("H.RishabRaj Purchase",style: AppTextstyle.ts18BB.copyWith(color: AppColor.blue),)
                ],
              ),
              const SizedBox(height: 10.0),
              const CircularProgressIndicator(),
              const SizedBox(height: 10.0),
              Text(
                title,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  // Error Snackbar
  static void showErrorSnackbar(String message) {
    Get.snackbar(
      "H.Rishabraj PURCHASE",
      message,
      titleText: Text(
        "H.Rishabraj PURCHASE",
        style: AppTextstyle.ts20WM,
      ),
      messageText: Text(
        message,
        style: AppTextstyle.ts14WR,
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: AppColor.transparentRed,
      borderRadius: 10.0,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Success Snackbar
  static void showSuccessSnackbar(String message) {
    Get.snackbar(
      "H.Rishabraj PURCHASE",
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: AppColor.transparentGreen,
      borderRadius: 10.0,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Warning Snackbar
  static void showWarningSnackbar(String message) {
    Get.snackbar(
      "H.Rishabraj PURCHASE",
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: AppColor.transparentOrange,
      borderRadius: 10.0,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Error Dialog
  static void showErrorDialog(String title, String description) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage("assets/images/common/logo.png"),
                    width: 25.0,
                    height: 25.0,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    title,
                    style: AppTextstyle.ts14BB,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Text(
                description,
                style: AppTextstyle.ts16BM,
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: const Text(
                  "Close",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

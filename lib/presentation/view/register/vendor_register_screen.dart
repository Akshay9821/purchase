import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/register/register_controller.dart';
import 'package:purchase/presentation/widget/common/button/custom_button.dart';
import 'package:purchase/presentation/widget/util/custom_textfield.dart';
import 'package:purchase/presentation/widget/util/dropdown/custom_dropdown.dart';

class VendorRegisterScreen extends StatelessWidget {
  const VendorRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Image(
              image: AssetImage("assets/images/common/logo.png"),
              width: 25.0,
              height: 25.0,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Register Now",
                  style: AppTextstyle.ts14BR.copyWith(fontSize: 15.0),
                ),
              ),
            ),
          ],
        ),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(height: 30.0),
            SizedBox(
              width: CommonFunction.getActualWidth(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to H.RISHABRAJ's (Purchase App)",
                      style: AppTextstyle.ts18BB.copyWith(
                          letterSpacing: 0.3,
                          fontSize: 18.0,
                          color: AppColor.black),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Vendor Registration!",
                      style: AppTextstyle.ts18BB.copyWith(
                        color: AppColor.blue,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Register to continue..",
                    style: AppTextstyle.ts14BB,
                  )),
            ),
            const SizedBox(height: 30.0),
            CustomTextField(
              textController: controller.companyNameC,
              hint: "Company Name*",
              maxCharacters: 25,
            ),
            CustomTextField(
              textController: controller.vendorNameC,
              hint: "Vendor Name*",
              maxCharacters: 25,
            ),
            Container(
                margin: const EdgeInsetsDirectional.only(bottom: 20.0),
                width: CommonFunction.getActualWidth(context) - 38.0,
                child: Obx(
                  () => TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.phoneC,
                    readOnly: controller.isPhoneVerified.value,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                      labelText: "Phone Number*",
                      labelStyle: AppTextstyle.ts16GR,
                      hintText: "Phone Number*",
                      hintStyle: AppTextstyle.ts16GR,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.blue,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.blue,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: Obx(
                        () => (controller.isPhoneVerified.value)
                            ? const Image(
                                image: AssetImage(
                                    "assets/images/common/verified.png"),
                                width: 10.0,
                                height: 20.0,
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, right: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    controller.sendPhoneOtp();
                                  },
                                  child: Text(
                                    "Verify Phone",
                                    style: AppTextstyle.ts16BR.copyWith(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(bottom: 20.0),
                width: CommonFunction.getActualWidth(context) - 38.0,
                child: Obx(
                  () => TextFormField(
                    keyboardType: TextInputType.text,
                    controller: controller.emailC,
                    readOnly: controller.isEmailVerified.value,
                    decoration: InputDecoration(
                      labelText: "Email Id*",
                      labelStyle: AppTextstyle.ts16GR,
                      hintText: "Email Id*",
                      hintStyle: AppTextstyle.ts16GR,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.blue,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.blue,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: Obx(
                        () => (controller.isEmailVerified.value)
                            ? const Image(
                                image: AssetImage(
                                    "assets/images/common/verified.png"),
                                width: 10.0,
                                height: 20.0,
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, right: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    controller.sendEmailOtp();
                                  },
                                  child: Text(
                                    "Verify Email",
                                    style: AppTextstyle.ts16BR.copyWith(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                )),
            // ),
            Obx(
              () => (controller.isEmailVerified.value &&
                      controller.isPhoneVerified.value)
                  ? CustomButton(
                      title: "Register",
                      onTapFunction: () {
                        controller.registerUser();
                      },
                    )
                  : CustomButton(
                      title: "Register",
                      onTapFunction: () {},
                      isDisable: true,
                    ),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: RichText(
                  text: TextSpan(
                      text: "Already have an account? ",
                      style: AppTextstyle.ts14BR,
                      children: [
                        TextSpan(
                            text: "Login",
                            style: AppTextstyle.ts16BR.copyWith(
                                color: AppColor.blue,
                                decoration: TextDecoration.underline))
                      ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/login/login_controller.dart';
import 'package:purchase/presentation/view/login/widgets/custom_otp_textfield.dart';
import 'package:purchase/presentation/widget/common/button/custom_button.dart';
import 'package:purchase/presentation/widget/util/custom_textfield.dart';
import 'package:purchase/utils/routes/app_route.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double textBoxSize = (CommonFunction.getActualWidth(context) - 55) / 6;
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: CommonFunction.getActualWidth(context),
          height: CommonFunction.getActualHeight(context),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150.0,
                color: AppColor.blue,
              ),
              const Image(
                image: AssetImage("assets/images/common/logo_with_name.png"),
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  Obx(
                    () => Container(
                      margin: !controller.isPhoneCompleted.value
                          ? const EdgeInsetsDirectional.only(bottom: 20.0)
                          : const EdgeInsetsDirectional.only(bottom: 0.0),
                      width: CommonFunction.getActualWidth(context) - 38.0,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.loginInfoC,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        readOnly: controller.isPhoneCompleted.value,
                        onChanged: (value) {
                          if (controller.loginInfoC.value.text.length == 10) {
                            controller.isPhoneNumberEntered.value = true;
                          } else {
                            controller.isPhoneNumberEntered.value = false;
                          }
                        },
                        decoration: InputDecoration(
                          labelStyle: AppTextstyle.ts16GR,
                          hintText: "Enter Mobile Number",
                          hintStyle: AppTextstyle.ts16GR,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.blue,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomOTPTextField(
                          textController: controller.otpC1,
                          textBoxSize: textBoxSize,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                        CustomOTPTextField(
                          textController: controller.otpC2,
                          textBoxSize: textBoxSize,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                        CustomOTPTextField(
                          textController: controller.otpC3,
                          textBoxSize: textBoxSize,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                        CustomOTPTextField(
                          textController: controller.otpC4,
                          textBoxSize: textBoxSize,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                        CustomOTPTextField(
                          textController: controller.otpC5,
                          textBoxSize: textBoxSize,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                        CustomOTPTextField(
                          textController: controller.otpC6,
                          textBoxSize: textBoxSize,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Obx(
                    () => (controller.isPhoneCompleted.value)
                        ? CustomButton(
                            title: "VERIFY OTP",
                            onTapFunction: () {
                              controller.verifyOTP();
                            },
                          )
                        : Obx(
                            () => CustomButton(
                              title: "SEND OTP",
                              isDisable: !controller.isPhoneNumberEntered.value,
                              onTapFunction: () {
                                controller.sendOTP();
                              },
                            ),
                          ),
                  ),
                  Obx(
                    () => (controller.isPhoneCompleted.value)
                        ? Container()
                        : InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.vendotRegister);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              child: RichText(
                                text: TextSpan(
                                    text: "Not Registered Yet? ",
                                    style: AppTextstyle.ts14GR,
                                    children: [
                                      TextSpan(
                                          text: " Register Now",
                                          style: AppTextstyle.ts16GR.copyWith(
                                              color: AppColor.blue,
                                              decoration:
                                                  TextDecoration.underline))
                                    ]),
                              ),
                            ),
                          ),
                  ),
                  Obx(
                    () => (controller.isPhoneCompleted.value)
                        ? Wrap(
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const SizedBox(height: 20.0),
                              Text(
                                "Didn't you receive any code?",
                                style: AppTextstyle.ts16GR,
                              ),
                              const SizedBox(height: 10.0),
                              InkWell(
                                onTap: () {
                                  controller.sendOTP();
                                },
                                child: Text(
                                  "RESEND NEW CODE",
                                  style: AppTextstyle.ts16BB.copyWith(
                                      color: AppColor.blue, fontSize: 18.0),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

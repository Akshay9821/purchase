import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/constant.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/model/vendor_registration_model.dart';
import 'package:purchase/presentation/view/login/widgets/custom_otp_textfield.dart';
import 'package:purchase/presentation/widget/common/button/custom_button.dart';
import 'package:purchase/service/base_client.dart';
import 'package:purchase/utils/dialog_helper.dart';
import 'package:purchase/utils/routes/app_route.dart';

class RegisterController extends GetxController {
  late TextEditingController companyNameC,
      vendorNameC,
      phoneC,
      emailC,
      otpC1,
      otpC2,
      otpC3,
      otpC4,
      otpC5,
      otpC6;
  // Phone and Email verification variable
  var isPhoneVerified = false.obs;
  var isEmailVerified = false.obs;
  String phoneOTP = "";
  String emailOTP = "";

  // OTP Section
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void onInit() {
    super.onInit();
    initializeController();
  }

  void initializeController() {
    companyNameC = TextEditingController();
    vendorNameC = TextEditingController();
    phoneC = TextEditingController();
    emailC = TextEditingController();
    otpC1 = TextEditingController();
    otpC2 = TextEditingController();
    otpC3 = TextEditingController();
    otpC4 = TextEditingController();
    otpC5 = TextEditingController();
    otpC6 = TextEditingController();
  }

  bool validateForm() {
    if (companyNameC.value.text.length < 2) {
      DialogHelper.showErrorSnackbar("Company Name is invalid");
      return false;
    }
    if (companyNameC.value.text.length > 25) {
      DialogHelper.showErrorSnackbar("Company Name characters exceded max 25!");
      return false;
    }
    if (companyNameC.value.text.trim().length > 25) {
      DialogHelper.showErrorSnackbar(
          "White Spaces are Not Allowed for Company Name!");
      return false;
    }
    if (vendorNameC.value.text.length < 2) {
      DialogHelper.showErrorSnackbar("Vendor Name is invalid");
      return false;
    }
    if (vendorNameC.value.text.length > 25) {
      DialogHelper.showErrorSnackbar("Vendor Name characters exceded max 25!");
      return false;
    }
    if (vendorNameC.value.text.trim().length > 25) {
      DialogHelper.showErrorSnackbar(
          "White Spaces are Not Allowed for Vendor Name!");
      return false;
    }
    if (phoneC.value.text.length != 10) {
      DialogHelper.showErrorSnackbar("Invalid Phone Number");
      return false;
    }
    if (!emailC.value.text.isEmail) {
      DialogHelper.showErrorSnackbar("Invalid Email Id");
      return false;
    }
    return true;
  }

  Future registerUser() async {
    if (!validateForm()) {
      return;
    }
    DialogHelper.showLoader("Creating user");
    String url =
        "${Constant.baseUrl}/VendorRegistration/AddUpdateVendorRegistration";
    dynamic payload = {
      "vendorName": vendorNameC.value.text,
      "companyName": companyNameC.value.text,
      "mobileNumber": phoneC.value.text,
      "emailId": emailC.value.text,
      "deviceToken": "TEST"
    };
    try {
      var response =
          await BaseClient.postRequestWithoutAuthentication(url, payload);
      var jsonResponse = jsonDecode(jsonDecode(response));
      var validatedResponse = BaseClient.validateResponse(jsonResponse);
      if (validatedResponse == "1") {
        // Save Data
        var userModel = VendorRegistrationModel.fromJson(jsonResponse["Data"]);
        Constant.staticStorage.write("token", userModel.data.token);
        Constant.staticStorage.write("user", jsonEncode(userModel));
        Constant.staticStorage
            .write("profilePicture", userModel.data.profilePicture);
        Constant.staticStorage.write("roleType", userModel.data.role);

        CommonFunction.closeAllPopups();
        Get.offAllNamed(AppRoute.login);
      } else {
        CommonFunction.closeAllPopups();
        DialogHelper.showErrorSnackbar(validatedResponse);
      }
    } catch (e) {
      CommonFunction.closeAllPopups();
      DialogHelper.showErrorSnackbar(e.toString());
    }
  }

  void showOTPBottomSheet(String credential, bool isEmail) {
    double textBoxSize = (CommonFunction.getActualWidth(Get.context!) - 55) / 6;
    Get.bottomSheet(
      Container(
        height: 300,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isEmail
                      ? Text(
                          "EMAIL VERIFICATION",
                          style: AppTextstyle.ts18BB,
                        )
                      : Text(
                          "PHONE VERIFICATION",
                          style: AppTextstyle.ts18BB,
                        ),
                  // InkWell(
                  //   onTap: () {
                  //     clearOTPField();
                  //     Get.back();
                  //   },
                  //   child: Icon(
                  //     Icons.cancel,
                  //     color: AppColor.primary,
                  //     size: 30.0,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: AppColor.grey,
                ),
              ),
              const SizedBox(height: 10.0),
              RichText(
                text: TextSpan(
                  text: "OTP has been sent to ",
                  style: AppTextstyle.ts16BR,
                  children: [
                    TextSpan(
                      text: credential,
                      style: AppTextstyle.ts16BR,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOTPTextField(
                    textController: otpC1,
                    textBoxSize: textBoxSize,
                    focusNode: focusNodes[0],
                    onChanged: (value) {
                      moveToNextField(Get.context!, 0);
                    },
                  ),
                  CustomOTPTextField(
                    textController: otpC2,
                    textBoxSize: textBoxSize,
                    focusNode: focusNodes[1],
                    onChanged: (value) {
                      moveToNextField(Get.context!, 1);
                    },
                  ),
                  CustomOTPTextField(
                    textController: otpC3,
                    textBoxSize: textBoxSize,
                    focusNode: focusNodes[2],
                    onChanged: (value) {
                      moveToNextField(Get.context!, 2);
                    },
                  ),
                  CustomOTPTextField(
                    textController: otpC4,
                    textBoxSize: textBoxSize,
                    focusNode: focusNodes[3],
                    onChanged: (value) {
                      moveToNextField(Get.context!, 3);
                    },
                  ),
                  CustomOTPTextField(
                    textController: otpC5,
                    textBoxSize: textBoxSize,
                    focusNode: focusNodes[4],
                    onChanged: (value) {
                      moveToNextField(Get.context!, 4);
                    },
                  ),
                  CustomOTPTextField(
                    textController: otpC6,
                    textBoxSize: textBoxSize,
                    focusNode: focusNodes[5],
                    onChanged: (value) {
                      moveToNextField(Get.context!, 5);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    title: "VERFIY OTP",
                    isHalf: true,
                    onTapFunction: () {
                      String otp =
                          "${otpC1.value.text}${otpC2.value.text}${otpC3.value.text}${otpC4.value.text}${otpC5.value.text}${otpC6.value.text}";
                      validateOTP(
                        isEmail,
                        otp,
                      );
                    },
                  ),
                  CustomButton(
                    title: "CANCEL",
                    isHalf: true,
                    onTapFunction: () {
                      clearOTPField();
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      isDismissible: false,
    );
  }

  Future sendPhoneOtp() async {
    if (phoneC.value.text.length != 10) {
      DialogHelper.showErrorSnackbar("Invalid Phone Number");
      return;
    }
    bool apiResult = await apiCallToSendPhoneOTP();
    if (apiResult) {
      showOTPBottomSheet(phoneC.value.text, false);
    }
  }

  Future sendEmailOtp() async {
    if (!emailC.value.text.isEmail) {
      DialogHelper.showErrorSnackbar("Invalid Email Id");
      return;
    }
    bool apiResult = await apiCallToSendEmailOTP();
    if (apiResult) {
      showOTPBottomSheet(emailC.value.text, true);
    }
  }

  Future<bool> apiCallToSendEmailOTP() async {
    DialogHelper.showLoader("Sending OTP");
    String otp = CommonFunction.generateRandom6DigitNumber().toString();
    String url = "${Constant.baseUrl}/StaticData/SendEmail";
    dynamic payload = {
      "toEmail": emailC.value.text,
      "bccEmail": "",
      "ccEmail": "",
      "emailSubject": "HRR PURCHASE: OTP for email verification",
      "emailBody": '''
      Your OTP for HRR PURCHASE App login is: $otp. 
      Please enter this code within the next 30 minutes to verify your identity.
      Thank you,
      H.RISHABRAJ
      PURCHASE
      '''
    };
    try {
      var response =
          await BaseClient.postRequestWithoutAuthentication(url, payload);
      print(response);
      var jsonResponse = jsonDecode(jsonDecode(response));
      var validatedResponse = BaseClient.validateResponse(jsonResponse);
      if (validatedResponse == "1") {
        // Save OTP
        emailOTP = otp;
        print(emailOTP);
        Get.back();
        return true;
      } else {
        Get.back();
        DialogHelper.showErrorSnackbar(validatedResponse);
        return false;
      }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorSnackbar(e.toString());
      return false;
    }
  }

  void moveToNextField(BuildContext context, int currentIndex) {
    if (currentIndex < focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[currentIndex + 1]);
    }
  }

  Future<bool> apiCallToSendPhoneOTP() async {
    DialogHelper.showLoader("Sending OTP");
    String otp = CommonFunction.generateRandom6DigitNumber().toString();
    String url = "${Constant.baseUrl}/StaticData/PullStaticData";
    try {
      var response = await BaseClient.getRequestWithoutAuthentication(url);
      var jsonResponse = jsonDecode(jsonDecode(response));
      var validatedResponse = BaseClient.validateResponse(jsonResponse);
      if (validatedResponse == "1") {
        // Save OTP

        // phoneOTP = otp;
        phoneOTP = "111111";

        // print(phoneOTP);
        Get.back();
        return true;
      } else {
        Get.back();
        DialogHelper.showErrorSnackbar(validatedResponse);
        return false;
      }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorSnackbar(e.toString());
      return false;
    }
  }

  void clearOTPField() {
    otpC1.clear();
    otpC2.clear();
    otpC3.clear();
    otpC4.clear();
    otpC5.clear();
    otpC6.clear();
  }

  void validateOTP(bool isEmail, String otp) {
    if (isEmail) {
      if (emailOTP == otp) {
        clearOTPField();
        isEmailVerified.value = true;
        Get.back();
      } else {
        if (otp.isEmpty) {
          DialogHelper.showErrorSnackbar("OTP is required");
        } else {
          DialogHelper.showErrorSnackbar("Invalid OTP");
        }
      }
    } else {
      if (phoneOTP == otp) {
        clearOTPField();
        isPhoneVerified.value = true;
        Get.back();
      } else {
        if (otp.isEmpty) {
          DialogHelper.showErrorSnackbar("OTP is required");
        } else {
          DialogHelper.showErrorSnackbar("Invalid OTP");
        }
      }
    }
  }
}

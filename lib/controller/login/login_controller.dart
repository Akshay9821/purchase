import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/constant.dart';
import 'package:purchase/model/user_registration_model.dart';
import 'package:purchase/model/vendor_registration_model.dart';
import 'package:purchase/service/base_client.dart';
import 'package:purchase/utils/dialog_helper.dart';
import 'package:purchase/utils/routes/app_route.dart';

class LoginController extends GetxController {
  late TextEditingController loginInfoC,
      passwordC,
      otpC1,
      otpC2,
      otpC3,
      otpC4,
      otpC5,
      otpC6;
  String sentOTP = "";
  String teamMemberId = "";
  final isLoading = false.obs;
  var isPhoneCompleted = false.obs;
  String phoneOTP = "";
  var isPhoneNumberEntered = false.obs;

  @override
  void onInit() {
    super.onInit();
    loginInfoC = TextEditingController();
    passwordC = TextEditingController();
    otpC1 = TextEditingController();
    otpC2 = TextEditingController();
    otpC3 = TextEditingController();
    otpC4 = TextEditingController();
    otpC5 = TextEditingController();
    otpC6 = TextEditingController();
    // sentOTP = Get.arguments[0]["sentOTP"];
  }

  bool validateCredentials() {
    if (loginInfoC.value.text == "") {
      CommonFunction.closeAllPopups();
      DialogHelper.showErrorSnackbar("Email | Phone | EmpId is required");
      return false;
    }
    if (passwordC.value.text == "") {
      CommonFunction.closeAllPopups();
      DialogHelper.showErrorSnackbar("Password is required");
      return false;
    }
    return true;
  }

  Future apiCallForLogin() async {
    DialogHelper.showLoader("Logging In");

    String url =
        "${Constant.baseUrl}/Authentication/IsValidateMobileNumber?mobileNumber=${loginInfoC.value.text}&deviceToken=TEST";
    try {
      var response = await BaseClient.getRequestWithoutAuthentication(url);
      var jsonResponse = jsonDecode(jsonDecode(response));
      if (jsonResponse["IsSuccess"]) {
        // Save Data
        var repsonseModel;

        if (jsonResponse["Data"][0]["Role"] != "Vendor") {
          repsonseModel = userRegistrationModelFromJson(response);
        } else {
          repsonseModel = vendorRegistrationModelFromJson(response);
        }

        Constant.staticStorage.write("token", repsonseModel.data.token);
        Constant.staticStorage.write("roleType", repsonseModel.data.role);
        Constant.staticStorage
            .write("profilePicture", repsonseModel.data.profilePicture ?? "");
        Constant.staticStorage.write("user", jsonEncode(repsonseModel.data));

        Get.back();
        String userType = Constant.staticStorage.read("roleType");
        if (userType == "Head Of Department" ||
            userType == "Managing Director" ||
            userType == "Site Engineer" ||
            userType == "Site Supervisor") {
          Get.offAllNamed(AppRoute.bottomNavigation);
          // Site Supervisor
        } else if (userType == "Vendor") {
          Get.offAllNamed(AppRoute.bottomNavigation);
        } else {
          Get.offAllNamed(AppRoute.bottomNavigation);
        }
      } else {
        Get.back();
        DialogHelper.showErrorSnackbar(jsonResponse["ErrorMessage"][0]);
      }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorSnackbar(e.toString());
    } //9867440666
  }

  Future sendOTP() async {
    if (loginInfoC.value.text.length != 10) {
      DialogHelper.showErrorSnackbar("Invalid phone number");
      return;
    }

    DialogHelper.showLoader("Sending OTP");
    String otp = CommonFunction.generateRandom6DigitNumber().toString();
    // String url = "${Constant.baseUrl}/StaticData/PullStaticData";
    try {
      // var response = await BaseClient.getRequestWithoutAuthentication(url);
      // var jsonResponse = jsonDecode(jsonDecode(response));
      // var validatedResponse = BaseClient.validateResponse(jsonResponse);
      // if (validatedResponse == "1") {
      // Save OTP
      phoneOTP = otp;
      print(phoneOTP);
      isPhoneCompleted.value = true;
      Get.back();
      return true;
      // } else {
      //   Get.back();
      //   DialogHelper.showErrorSnackbar(validatedResponse);
      //   return false;
      // }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorSnackbar(e.toString());
      return false;
    }
  }

  void verifyOTP() {
    String otp =
        "${otpC1.value.text}${otpC2.value.text}${otpC3.value.text}${otpC4.value.text}${otpC5.value.text}${otpC6.value.text}";
    if (otp == "111111") {
      apiCallForLogin();
    } else {
      if (otp.isEmpty) {
        DialogHelper.showErrorSnackbar("OTP is required");
      } else {
        DialogHelper.showErrorSnackbar("Invalid OTP");
      }
    }
  }

  @override
  void onClose() {
    otpC1.dispose();
    otpC2.dispose();
    otpC3.dispose();
    otpC4.dispose();
    otpC5.dispose();
    otpC6.dispose();
    super.onClose();
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/constant.dart';
import 'package:purchase/service/base_client.dart';
import 'package:purchase/utils/dialog_helper.dart';
import 'package:purchase/utils/routes/app_route.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashController extends GetxController {
  var isUpdate = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(const Duration(seconds: 3), () {
        getRefreshData();
      });
    });
  }

  Future getRefreshData() async {
    String url = "${Constant.baseUrl}/StaticData/IsRefreshData";
    try {
      var response = await BaseClient.getRequestWithoutAuthentication(url);
      var jsonResponse = jsonDecode(jsonDecode(response));
      var validatedResponse = BaseClient.validateResponse(jsonResponse);
      if (validatedResponse == "1") {
        var data = jsonResponse["Data"][0];

        if (data != null) {
          isUpdate.value = checkAppVersion(data);
          if (!isUpdate.value) {
            int? refreshStaticDataCount =
                Constant.staticStorage.read("refreshStaticDataCount");
            if (refreshStaticDataCount == null ||
                refreshStaticDataCount != data["RefreshStaticDataCount"]) {
              Constant.staticStorage.write(
                  "refreshStaticDataCount", data["RefreshStaticDataCount"]);

              getAllStaticData();
            } else {
              handleNavigation();
            }
          }
        }
      } else {
        DialogHelper.showErrorSnackbar(validatedResponse);
      }
    } catch (e) {
      DialogHelper.showErrorSnackbar(e.toString());
    }
  }

  bool checkAppVersion(dynamic data) {
    if (Platform.isAndroid) {
      if (Constant.androidVersion != data["AndroidVersion"]) {
        return true;
      } else {
        return false;
      }
    } else {
      if (Constant.iosVersion != data["IosVersion"]) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future getAllStaticData() async {
    String url = "${Constant.baseUrl}/StaticData/PullStaticData";
    try {
      var response = await BaseClient.getRequestWithoutAuthentication(url);
      var jsonResponse = jsonDecode(jsonDecode(response));
      var validatedResponse = BaseClient.validateResponse(jsonResponse);
      if (validatedResponse == "1") {
        var data = jsonResponse["Data"];
        // User Type
        Constant.staticStorage.write("userType", jsonEncode(data[0]));
        // Project Data
        Constant.staticStorage.write("projectData", jsonEncode(data[1]));
        // Country State Data
        Constant.staticStorage.write("countryStateData", jsonEncode(data[2]));
        // Material Data
        Constant.staticStorage.write("materialData", jsonEncode(data[3]));
        // Bank List
        Constant.staticStorage.write("bankList", jsonEncode(data[4]));

        handleNavigation();
      } else {
        DialogHelper.showErrorSnackbar(validatedResponse);
      }
    } catch (e) {
      DialogHelper.showErrorSnackbar(e.toString());
    }
  }

  void handleNavigation() {
    var token = Constant.staticStorage.read("token");
    if (token == null) {
      var walkthrough = Constant.storage.read("walkthrough");
      if (walkthrough != null && walkthrough == "1") {
        Get.offNamed(AppRoute.login);
      } else {
        Constant.storage.write("walkthrough", "1");
        Get.offNamed(AppRoute.walkThrough);
      }
    } else {
      String userType = Constant.staticStorage.read("roleType");
      if (userType == "Head of Department" ||
          userType == "Managing Director" ||
          userType == "Site Engineer" ||
          userType == "Site Supervisor") {
        Get.offNamed(AppRoute.bottomNavigation);
      } else if (userType == "Vendor") {
        Get.offNamed(AppRoute.vendor);
      } else {
        Get.offNamed(AppRoute.walkThrough);
      }
    }
  }

  Future<void> launchStore() async {
    if (Platform.isIOS) {
      String appId = "id6466376811";
      String url = "itms-apps://itunes.apple.com/app/$appId";
      await launchUrl(Uri.parse(url));
    } else if (Platform.isAndroid) {
      String appPackageName = "com.hrr.hrmpeople1";
      String url = "market://details?id=$appPackageName";
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch the store.';
    }
  }
}

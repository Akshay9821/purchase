import 'dart:convert';

import 'package:get/get.dart';
import 'package:purchase/common/constant.dart';
import 'package:purchase/model/vendor_registration_model.dart';
import 'package:purchase/utils/dialog_helper.dart';
import 'package:purchase/utils/routes/app_route.dart';

class MoreController extends GetxController {
  var menuList = List<bool>.filled(6, false, growable: false).obs;
  String userType = "";
  @override
  void onInit() {
    super.onInit();
    userType = Constant.staticStorage.read("roleType");
  }

  void expandMenu(int index) {
    for (int i = 0; i < menuList.length; i++) {
      if (i == index) {
        menuList[i] = !menuList[i];
        continue;
      }
      menuList[i] = false;
    }
    menuList = menuList;
  }

  Future logOut() async {
    Constant.staticStorage.erase();
    Get.offAllNamed(AppRoute.splash);
  }
}

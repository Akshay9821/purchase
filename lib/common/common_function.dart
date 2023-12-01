import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommonFunction {
  // Function to return width
  static double getWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  // Function to return actual height
  static double getActualHeight(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    var padding = MediaQuery.of(context).viewPadding;
    height = height - padding.top - padding.bottom;
    return height;
  }

  // Function to return height without Appbar
  static double getHeightWithoutAppbar(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    var padding = MediaQuery.of(context).viewPadding;
    height = height - padding.top - padding.bottom - kToolbarHeight;
    return height;
  }

  // Function to return height without BottomNavbar
  static double getHeightWithoutBottomNavbar(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    var padding = MediaQuery.of(context).viewPadding;
    height = height - padding.top - padding.bottom - kBottomNavigationBarHeight;
    return height;
  }

  // Function to return height without BottomNavbar and Appbar
  static double getHeightWithoutBottomNavbarAndAppbar(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    var padding = MediaQuery.of(context).viewPadding;
    height = height -
        padding.top -
        padding.bottom -
        kToolbarHeight -
        kBottomNavigationBarHeight;
    return height;
  }

  // Function to close all popups
  static void closeAllPopups() {
    Get.closeAllSnackbars();
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}

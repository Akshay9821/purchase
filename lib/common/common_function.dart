import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommonFunction {
  // Function to return width
  static double getActualWidth(BuildContext context) {
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

  // Function to format date
  static String formatDateToDDMMYYYY(DateTime dt) {
    String ans = "";
    ans += dt.day.toString().padLeft(2, "0");
    ans += "-";
    ans += dt.month.toString().padLeft(2, "0");
    ans += "-";
    ans += dt.year.toString();
    return ans;
  }

  // Function to format date in YYYYYMMDD
  static String formatDateFromStringtoYYYYMMDD(String dt) {
    String ans = "";
    int year = int.parse(dt.substring(6));
    int month = int.parse(dt.substring(3, 5));
    int day = int.parse(dt.substring(0, 2));
    ans += year.toString();
    ans += "-";
    ans += month.toString().padLeft(2, "0");
    ans += "-";
    ans += day.toString().padLeft(2, "0");
    return ans;
  }

  // Function to format date in DDMMYYYY
  static String formatDateFromStringtoDDMMYYYY(String dt) {
    String ans = "";
    int year = int.parse(dt.substring(6));
    int month = int.parse(dt.substring(3, 5));
    int day = int.parse(dt.substring(0, 2));
    ans += day.toString().padLeft(2, "0");
    ans += "-";
    ans += month.toString().padLeft(2, "0");
    ans += "-";
    ans += year.toString();
    return ans;
  }

  static String getIfDateTimeIsNullEmpty(DateTime? dateTime) {
    if (dateTime == null || dateTime.isBefore(DateTime(1))) {
      return "-";
    }

    return dateTime.toString();
  }

  // Function to format date in YYYYYMMDD
  static String formatDateFromDatetoYYYYMMDD(DateTime dt) {
    String ans = "";
    int year = dt.year;
    int month = dt.month;
    int day = dt.day;
    ans += year.toString();
    ans += "-";
    ans += month.toString().padLeft(2, "0");
    ans += "-";
    ans += day.toString().padLeft(2, "0");
    return ans;
  }

  static String formatDateFromDatetoDDMMYYYY(DateTime dt) {
    String ans = "";
    int year = dt.year;
    int month = dt.month;
    int day = dt.day;

    ans += day.toString().padLeft(2, "0");
    ans += "-";
    ans += month.toString().padLeft(2, "0");
    ans += "-";
    ans += year.toString();
    return ans;
  }

  // Function to parse string to date
  static DateTime parseStringToDate(String dt) {
    int year = int.parse(dt.substring(6));
    int month = int.parse(dt.substring(3, 5));
    int day = int.parse(dt.substring(0, 2));
    DateTime result = DateTime(year, month, day);
    return result;
  }

  // Function to parse date to Day, Date Month Format
  static String formatDateToDayMonth(DateTime dt) {
    Map<int, String> weekMap = {
      1: "Mon",
      2: "Tue",
      3: "Wed",
      4: "Thu",
      5: "Fri",
      6: "Sat",
      7: "Sun",
    };
    Map<int, String> monthMap = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec",
    };
    String ans = "";
    ans += weekMap[dt.weekday]!;
    ans += ", ";
    ans += dt.day.toString().padLeft(2, "0");
    ans += " ";
    ans += monthMap[dt.month]!;
    return ans;
  }

  // Function to parse date to WeekDay Format
  static String formatDateToWeekDay(DateTime dt) {
    Map<int, String> weekMap = {
      1: "Mon",
      2: "Tue",
      3: "Wed",
      4: "Thu",
      5: "Fri",
      6: "Sat",
      7: "Sun",
    };

    String ans = "";
    ans += weekMap[dt.weekday]!;
    return ans;
  }

// Function to parse date to  Month Format
  static String formatDateToMonth(DateTime dt) {
    Map<int, String> monthMap = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec",
    };
    String ans = "";
    ans += monthMap[dt.month]!;
    ans += "";
    return ans;
  }

  // Function to parse date to  Year Format
  static String formatDateToYear(DateTime dt) {
    Map<int, String> monthMap = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec",
    };
    String ans = " ";
    ans += dt.year.toString();
    ans += " ";
    return ans;
  }

  // Function to parse date to Day, Month Year Format
  static String formatDateToMontYear(DateTime dt) {
    Map<int, String> monthMap = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec",
    };
    String ans = "";
    ans += monthMap[dt.month]!;
    ans += " ";
    ans += dt.year.toString();
    return ans;
  }

  static String formatStringToMonthYear(String dt) {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(dt);
    Map<int, String> monthMap = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec",
    };

    String formattedDate = DateFormat("MMM y").format(dateTime);

    return formattedDate;
  }

  // Function to parse time to Day, Date Month Format
  static String formatDateToDayDateMontYear(DateTime dt) {
    Map<int, String> weekMap = {
      1: "Mon",
      2: "Tue",
      3: "Wed",
      4: "Thu",
      5: "Fri",
      6: "Sat",
      7: "Sun",
    };
    Map<int, String> monthMap = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec",
    };
    String ans = "";
    ans += weekMap[dt.weekday]!;
    ans += ", ";
    ans += dt.day.toString().padLeft(2, "0");
    ans += " ";
    ans += monthMap[dt.month]!;
    ans += " ";
    ans += dt.year.toString();
    return ans;
  }

  // Function to parse time to Day, Date Month Format
  static String formatDateToDateMontYear(DateTime dt) {
    Map<int, String> monthMap = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "Dec",
    };
    String ans = "";
    ans += dt.day.toString().padLeft(2, "0");
    ans += " ";
    ans += monthMap[dt.month]!;
    ans += ", ";
    ans += dt.year.toString();
    return ans;
  }

  // Function to get time from DateTime
  static String formatTimeFromDatetime(DateTime dt) {
    String ans = "";
    if (dt.hour >= 13) {
      ans += (dt.hour % 12).toString().padLeft(2, "0");
    } else {
      ans += dt.hour.toString().padLeft(2, "0");
    }
    ans += ":";
    ans += dt.minute.toString().padLeft(2, "0");

    if (dt.hour >= 13) {
      ans += " PM";
    } else {
      ans += " AM";
    }
    return ans;
  }

  static String formatTimeFromString(String dt) {
    String ans = "";
    int hour = int.parse(dt.substring(0, 2));
    int minute = int.parse(dt.substring(3));
    if (hour >= 13) {
      ans += (hour % 12).toString().padLeft(2, "0");
    } else {
      ans += hour.toString().padLeft(2, "0");
    }
    ans += ":";
    ans += minute.toString().padLeft(2, "0");

    if (hour >= 13) {
      ans += " PM";
    } else {
      ans += " AM";
    }
    return ans;
  }

  // Function to close all popups
  static void closeAllPopups() {
    Get.closeAllSnackbars();
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  // Function to get differnece in days
  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
  
  static int generateRandom6DigitNumber() {
    Random random = Random();
    int min = 100000;
    int max = 999999;
    return min + random.nextInt(max - min + 1);
  }

  static getWidth(BuildContext context) {}
}

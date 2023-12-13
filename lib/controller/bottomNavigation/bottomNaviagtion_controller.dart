import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/presentation/view/dashboard/dashboard_screen.dart';
import 'package:purchase/presentation/view/indend/view_indend_screen.dart';
import 'package:purchase/presentation/view/more/more_screen.dart';
import 'package:purchase/presentation/view/project_site/project_site_screen.dart';
import 'package:purchase/presentation/view/vendor/vendor_screen.dart';

class BottomNavigationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Widget> pageList = [
    const ViewIndendScreen(),
    const ProjectSiteScreen(),
    const DashboardScreen(),
    const VendorScreen(),
    const MoreScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 1,
      animationDuration: const Duration(seconds: 1),
    );
  }

  var selectedIndex = 1.obs;

  void handleBottomNavigation(int index) {
    selectedIndex.value = index;
  }
}

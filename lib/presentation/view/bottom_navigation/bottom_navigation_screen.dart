import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/controller/bottomNavigation/bottomNaviagtion_controller.dart';
import 'package:purchase/presentation/view/bottom_navigation/widgets/custom_indictor_widget.dart';

class BottomNavigationScreen extends GetView<BottomNavigationController> {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.pageList[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: Padding(
          padding: Platform.isIOS
              ? const EdgeInsets.only(bottom: 10.0)
              : const EdgeInsets.only(bottom: 0.0),
          child: Obx(
            () => TabBar(
              controller: controller.tabController,
              indicator: TopIndicator(),
              onTap: (index) {
                controller.handleBottomNavigation(index);
              },
              tabs: [
                Tab(
                  child: Image(
                    image: AssetImage((controller.selectedIndex.value == 0)
                        ? "assets/icons/home_selected.png"
                        : "assets/icons/home_selected.png"),
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
                Tab(
                  child: Image(
                    image: AssetImage((controller.selectedIndex.value == 1)
                        ? "assets/icons/home_selected.png"
                        : "assets/icons/home_selected.png"),
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
                Tab(
                  child: Image(
                    image: AssetImage((controller.selectedIndex.value == 2)
                        ? "assets/icons/home_selected.png"
                        : "assets/icons/home_selected.png"),
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
                Tab(
                  child: Image(
                    image: AssetImage((controller.selectedIndex.value == 3)
                        ? "assets/icons/home_selected.png"
                        : "assets/icons/home_selected.png"),
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
                Tab(
                  child: Image(
                    image: AssetImage((controller.selectedIndex.value == 4)
                        ? "assets/icons/home_selected.png"
                        : "assets/icons/home_selected.png"),
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

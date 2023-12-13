import 'package:get/get.dart';
import 'package:purchase/controller/bottomNavigation/bottomNaviagtion_controller.dart';
import 'package:purchase/controller/dashboard/dashboard_controller.dart';
import 'package:purchase/controller/indent/viewindend_controller.dart';
import 'package:purchase/controller/more/more_controller.dart';
import 'package:purchase/controller/project_site_controller.dart/project_site_controller.dart';
import 'package:purchase/controller/vendor/vendor_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
    Get.lazyPut<ViewIndendController>(() => ViewIndendController());
    Get.lazyPut<ProjectSiteController>(() => ProjectSiteController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<VendorController>(() => VendorController());
    Get.lazyPut<MoreController>(() => MoreController());
  }
}

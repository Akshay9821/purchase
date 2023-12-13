import 'package:get/get.dart';
import 'package:purchase/controller/vendor/vendor_controller.dart';
class VendorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorController>(() => VendorController());
  }
}

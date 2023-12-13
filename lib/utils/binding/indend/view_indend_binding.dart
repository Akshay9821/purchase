import 'package:get/get.dart';
import 'package:purchase/controller/indent/viewindend_controller.dart';

class ViewIndendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewIndendController>(() => ViewIndendController());
  }
}

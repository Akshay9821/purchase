import 'package:get/get.dart';
import 'package:purchase/controller/indent/indend_controller.dart';

class IndendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndendController>(() => IndendController());
  }
}

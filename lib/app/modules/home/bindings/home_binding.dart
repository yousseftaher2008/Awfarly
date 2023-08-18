import 'package:awfarly/app/modules/cart/bindings/cart_binding.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    CartBinding().dependencies();
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}

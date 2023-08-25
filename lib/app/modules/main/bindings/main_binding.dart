import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController(), permanent: true);
    Get.put<CartController>(CartController(), permanent: true);
  }
}

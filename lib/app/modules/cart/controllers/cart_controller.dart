import 'package:get/get.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  final productCount = 0.obs;

  void addProduct() => productCount.value++;
}

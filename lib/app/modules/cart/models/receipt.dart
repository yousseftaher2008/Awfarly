import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:awfarly/app/modules/cart/models/product.dart';
import 'package:get/get.dart';

class Receipt {
  late String storeName, storeId;
  late double totalPrice, savedPrice = 0;

  Receipt.fromJson(Map json) {
    final CartController cartController = Get.find<CartController>();
    storeId = json["storeId"];
    storeName = json["storeName"];
    totalPrice = json["total"].toDouble();
    final List jsonProducts = json["products"];
    for (int i = 0; i < jsonProducts.length; i++) {
      final product = jsonProducts[i];
      for (int j = 0; j < cartController.selectedProducts.length; j++) {
        final Product cartProduct = cartController.selectedProducts[j];
        if (product["id"] == cartProduct.id) {
          savedPrice += (cartProduct.maxPrice - product["price"].toDouble()) *
              cartProduct.count.value;
          cartProduct.finalPrice = product["price"].toDouble();
          break;
        }
      }
    }
  }
}

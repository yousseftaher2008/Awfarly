import 'package:awfarly/app/modules/cart/views/widgets/app_bar.dart';
import 'package:awfarly/app/modules/cart/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/app_bottom_sheet.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double pageHeight = Get.size.height;
    return Scaffold(
      body: SizedBox(
        height: pageHeight,
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: pageHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const CartFirstAppBar(),
                ListView.builder(
                  itemCount: controller.selectedProducts.length,
                  itemBuilder: (_, index) {
                    return CartItem(controller.selectedProducts[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Obx(
        () => controller.isSearching.value
            ? const SizedBox()
            : const AppBottomSheet(),
      ),
    );
  }
}

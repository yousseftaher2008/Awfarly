import 'package:awfarly/app/modules/cart/views/widgets/cart_app_bar.dart';
import 'package:awfarly/app/modules/cart/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/screen_dimensions.dart';
import '../../../shared/app_bottom_sheet.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: pageHeight(),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: pageHeight(),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CartFirstAppBar(),
                SizedBox(
                  height: pageHeight() - (pageHeight() / 5 + 50) - 125,
                  child: Obx(
                    () => ListView.builder(
                      padding:
                          EdgeInsets.all(controller.isSearching.value ? 0 : 10),
                      shrinkWrap: true,
                      itemCount: controller.isSearching.value
                          ? (controller.searchedProducts.length)
                          : (controller.selectedProducts.length + 1),
                      itemBuilder: (_, index) {
                        if (index == controller.selectedProducts.length &&
                            !controller.isSearching.value) {
                          return Obx(
                            () => controller.isSearching.value ||
                                    controller.selectedProducts.isEmpty
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () =>
                                          controller.isSearching.value = true,
                                      child: Text(
                                        "اضف منتج جديد",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                          );
                        }
                        return CartItem(
                          controller.isSearching.value
                              ? controller.searchedProducts[index]
                              : controller.selectedProducts[index],
                          asSearchProduct: controller.isSearching.value,
                        );
                      },
                    ),
                  ),
                ),
                Obx(
                  () => !controller.isSearching.value
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(pageWidth() - 50, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: controller.selectedProducts.isEmpty
                              ? null
                              : () {
                                  print(pageWidth());
                                },
                          child: const Text(
                            "عرض افضل فاتورة",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )
                      : const SizedBox(),
                )
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

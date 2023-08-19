import 'package:awfarly/app/modules/cart/views/widgets/cart_app_bar.dart';
import 'package:awfarly/app/modules/cart/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

import '../../../shared/app_bottom_sheet.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double pageHeight = Get.size.height;
    double pageWidth = Get.size.width;
    return Scaffold(
      body: SizedBox(
        height: pageHeight,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: pageHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CartFirstAppBar(),
                // Expanded(
                SizedBox(
                  height: pageHeight - (pageHeight / 5 + 50) - 125,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.selectedProducts.length + 1,
                    itemBuilder: (_, index) {
                      // return null;
                      print(
                          "get here $index ${controller.selectedProducts.length}");
                      if (index == controller.selectedProducts.length) {
                        return Obx(
                          () => controller.isSearching.value ||
                                  controller.selectedProducts.isEmpty
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "اضف منتج جديد",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold ,
                                      fontSize: 18,

                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                        );
                      }
                      return CartItem(controller.selectedProducts[index]);
                    },
                  ),
                ),

                Obx(
                  () => !controller.isSearching.value
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(pageWidth - 50, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: controller.selectedProducts.isEmpty
                              ? null
                              : () {},
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

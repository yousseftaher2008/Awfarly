import 'package:awfarly/app/constants/styles/button_styles.dart';
import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:awfarly/app/modules/cart/views/screens/best_receipt.dart';
import 'package:awfarly/app/modules/cart/views/widgets/cart_app_bar.dart';
import 'package:awfarly/app/modules/cart/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../constants/screen_dimensions.dart';
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
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CartFirstAppBar(),
                  SizedBox(
                    height: pageHeight() -
                        (controller.isSearching.value ? 0 : (220.h)) -
                        150.h,
                    child: controller.isGettingSearched.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.all(
                                controller.isSearching.value ? 0 : 10),
                            shrinkWrap: true,
                            itemCount: controller.isSearching.value
                                ? (controller.searchedProductsLen.value)
                                : (controller.selectedProductsLen.value + 1),
                            itemBuilder: (_, index) {
                              if (index ==
                                      controller.selectedProductsLen.value &&
                                  !controller.isSearching.value) {
                                return controller.selectedProducts.isEmpty
                                    ? const SizedBox()
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.isSearching.value = true;
                                            controller
                                                .mainController
                                                .isShowBottomSheet
                                                .value = false;
                                          },
                                          child: Text(
                                            "اضف منتج جديد",
                                            style: h3RegularPrimary,
                                          ),
                                        ),
                                      );
                              }
                              CartItem cartItem = CartItem(
                                controller.isSearching.value
                                    ? controller.searchedProducts[index]
                                    : controller.selectedProducts[index],
                                asSearchProduct: controller.isSearching.value,
                              );
                              if (controller.isSearching.value) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.addProduct(
                                      product:
                                          controller.searchedProducts[index],
                                    );
                                    controller.backFromSearching();
                                  },
                                  child: cartItem,
                                );
                              } else {
                                return cartItem;
                              }
                            },
                          ),
                  ),
                  if (!controller.isSearching.value)
                    ElevatedButton(
                      style: mainButtonStyle,
                      onPressed: controller.selectedProducts.isEmpty
                          ? null
                          : () {
                              controller.mainController.isShowBottomSheet
                                  .value = false;
                              controller.getBestReceipt();
                              Get.to(() => const BestReceipt())?.then(
                                (_) {
                                  controller.mainController.isShowBottomSheet
                                      .value = true;
                                },
                              );
                            },
                      child: Text(
                        "عرض افضل فاتورة",
                        style: h4BoldWhite,
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

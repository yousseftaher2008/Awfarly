import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:awfarly/app/modules/main/controllers/main_controller.dart';
import 'package:awfarly/app/routes/app_pages.dart';
import 'package:awfarly/app/shared/icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/styles/colors.dart';

class AppBottomSheet extends GetView<MainController> {
  const AppBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    // final FavoritesController _favoritesController = Get.find<FavoritesController>();
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 75,
            child: GestureDetector(
              onTap: () {
                if (AppPages.currentPage.value != AppPagesEnum.home) {
                  AppPages.currentPage.value = AppPagesEnum.home;
                }
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AppPages.currentPage.value == AppPagesEnum.home
                          ? SvgPicture.asset("assets/icons/home_filled.svg")
                          : SvgPicture.asset("assets/icons/home.svg"),
                    ),
                    FittedBox(
                      child: Text(
                        "الرئيسية",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppPages.currentPage.value == AppPagesEnum.home
                              ? primaryColor
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 75,
            child: GestureDetector(
              onTap: () {
                if (AppPages.currentPage.value != AppPagesEnum.orders) {
                  AppPages.currentPage.value = AppPagesEnum.orders;
                }
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AppPages.currentPage.value == AppPagesEnum.orders
                          ? SvgPicture.asset("assets/icons/order_filled.svg")
                          : SvgPicture.asset("assets/icons/order.svg"),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Text(
                        "مشترياتي",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              AppPages.currentPage.value == AppPagesEnum.orders
                                  ? primaryColor
                                  : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 75,
            child: GestureDetector(
              onTap: () {
                if (AppPages.currentPage.value != AppPagesEnum.cart) {
                  AppPages.currentPage.value = AppPagesEnum.cart;
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => IconBadge(
                      icon: Icon(
                        AppPages.currentPage.value == AppPagesEnum.cart
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                        color: AppPages.currentPage.value == AppPagesEnum.cart
                            ? primaryColor
                            : disableColor,
                        size: 25,
                      ),
                      value: "${cartController.selectedProducts.length}",
                      color: primaryColor,
                    ),
                  ),
                  const Spacer(),
                  Obx(
                    () => FittedBox(
                      child: Text(
                        "عربة التسوق",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppPages.currentPage.value == AppPagesEnum.cart
                              ? primaryColor
                              : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 75,
            child: GestureDetector(
              onTap: () {
                if (AppPages.currentPage.value != AppPagesEnum.wallet) {
                  AppPages.currentPage.value = AppPagesEnum.wallet;
                }
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AppPages.currentPage.value == AppPagesEnum.wallet
                          ? SvgPicture.asset("assets/icons/wallet_filled.svg")
                          : SvgPicture.asset("assets/icons/wallet.svg"),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Text(
                        "محفظتي",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              AppPages.currentPage.value == AppPagesEnum.wallet
                                  ? primaryColor
                                  : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 75,
            child: GestureDetector(
              onTap: () {
                if (AppPages.currentPage.value != AppPagesEnum.favorite) {
                  AppPages.currentPage.value = AppPagesEnum.favorite;
                }
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconBadge(
                      icon: Icon(
                        AppPages.currentPage.value == AppPagesEnum.favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            AppPages.currentPage.value == AppPagesEnum.favorite
                                ? primaryColor
                                : disableColor,
                        size: 25,
                      ),
                      value: "0",
                      color: const Color(0xFFF0BF41),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Text(
                        "المفضلة",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppPages.currentPage.value ==
                                  AppPagesEnum.favorite
                              ? primaryColor
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:awfarly/app/constants/styles/text_styles.dart';
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
    TextStyle defaultStyle(AppPagesEnum page) {
      return h5Bold.copyWith(
        color:
            AppPages.currentPage.value == page ? primaryColor : secondaryColor,
      );
    }

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
      child: Obx(
        () => Row(
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
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: AppPages.currentPage.value == AppPagesEnum.home
                            ? SvgPicture.asset("assets/icons/home_filled.svg")
                            : SvgPicture.asset("assets/icons/home.svg"),
                      ),
                      const Expanded(
                        child: FittedBox(
                          child: Text(" "),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          "الرئيسية",
                          style: defaultStyle(AppPagesEnum.home),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AppPages.currentPage.value == AppPagesEnum.orders
                          ? SvgPicture.asset("assets/icons/order_filled.svg")
                          : SvgPicture.asset("assets/icons/order.svg"),
                    ),
                    const Expanded(
                      child: FittedBox(
                        child: Text(" "),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "مشترياتي",
                        style: defaultStyle(AppPagesEnum.orders),
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
                  if (AppPages.currentPage.value != AppPagesEnum.cart) {
                    AppPages.currentPage.value = AppPagesEnum.cart;
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBadge(
                      icon: Icon(
                        AppPages.currentPage.value == AppPagesEnum.cart
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                        color: AppPages.currentPage.value == AppPagesEnum.cart
                            ? primaryColor
                            : secondaryColor,
                        size: 25,
                      ),
                      value: "${cartController.selectedProductsLen.value}",
                      color: primaryColor,
                    ),
                    const Expanded(
                      child: FittedBox(
                        child: Text(" "),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "عربة التسوق",
                        style: defaultStyle(AppPagesEnum.cart),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AppPages.currentPage.value == AppPagesEnum.wallet
                          ? SvgPicture.asset("assets/icons/wallet_filled.svg")
                          : SvgPicture.asset("assets/icons/wallet.svg"),
                    ),
                    const Expanded(
                      child: FittedBox(
                        child: Text(" "),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "محفظتي",
                        style: defaultStyle(AppPagesEnum.wallet),
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
                  if (AppPages.currentPage.value != AppPagesEnum.favorite) {
                    AppPages.currentPage.value = AppPagesEnum.favorite;
                  }
                },
                child: Column(
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
                                : secondaryColor,
                        size: 25,
                      ),
                      value: "0",
                      color: const Color(0xFFF0BF41),
                    ),
                    const Expanded(
                      child: FittedBox(
                        child: Text(" "),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "المفضلة",
                        style: defaultStyle(AppPagesEnum.favorite),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:awfarly/app/shared/icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../constants/styles/colors.dart';

enum Page { home, orders, cart, wallet, favorite }

Rx<Page> currentPage = Page.home.obs;

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    // final CartController _favoritesController = Get.find<FavoritesController>();
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
                if (currentPage.value != Page.home) {
                  currentPage.value = Page.home;
                  Get.offAllNamed(Routes.HOME);
                }
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: currentPage.value == Page.home
                          ? SvgPicture.asset("assets/icons/home_filled.svg")
                          : SvgPicture.asset("assets/icons/home.svg"),
                    ),
                    FittedBox(
                      child: Text(
                        "الرئيسية",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: currentPage.value == Page.home
                              ? enableIconColor
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
                if (currentPage.value != Page.orders) {
                  currentPage.value = Page.orders;
                  // Get.OffAllNamed(Routes.ORDERS);
                  Get.offAllNamed(Routes.HOME);
                }
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: currentPage.value == Page.orders
                          ? SvgPicture.asset("assets/icons/order_filled.svg")
                          : SvgPicture.asset("assets/icons/order.svg"),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Text(
                        "مشترياتي",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: currentPage.value == Page.orders
                              ? enableIconColor
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
                if (currentPage.value != Page.cart) {
                  currentPage.value = Page.cart;
                  Get.offAllNamed(Routes.CART);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => IconBadge(
                      icon: Icon(
                        currentPage.value == Page.cart
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                        color: currentPage.value == Page.cart
                            ? enableIconColor
                            : secondaryIconColor,
                        size: 25,
                      ),
                      value: "${cartController.selectedProducts.length}",
                      color: enableIconColor,
                    ),
                  ),
                  const Spacer(),
                  Obx(
                    () => FittedBox(
                      child: Text(
                        "عربة التسوق",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: currentPage.value == Page.cart
                              ? enableIconColor
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
                if (currentPage.value != Page.wallet) {
                  currentPage.value = Page.wallet;
                  Get.offAllNamed(Routes.HOME);
                  // Get.OffAllNamed(Routes.WALLET);
                }
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: currentPage.value == Page.wallet
                          ? SvgPicture.asset("assets/icons/wallet_filled.svg")
                          : SvgPicture.asset("assets/icons/wallet.svg"),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Text(
                        "محفظتي",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: currentPage.value == Page.wallet
                              ? enableIconColor
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
                if (currentPage.value != Page.favorite) {
                  currentPage.value = Page.favorite;
                  Get.offAllNamed(Routes.HOME);
                  // Get.OffAllNamed(Routes.FAVORITES);
                }
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconBadge(
                      icon: Icon(
                        currentPage.value == Page.favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: currentPage.value == Page.favorite
                            ? enableIconColor
                            : secondaryIconColor,
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
                          color: currentPage.value == Page.favorite
                              ? enableIconColor
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

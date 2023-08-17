// ignore_for_file: unrelated_type_equality_checks

import 'package:awfarly/app/shared/icon_badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import 'styles/colors.dart';

enum Page { home, orders, cart, wallet, favorite }

Rx<Page> currentPage = Page.home.obs;

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 75,
            child: GestureDetector(
              onTap: () {
                currentPage.value = Page.favorite;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconBadge(
                    icon: Obx(
                      () => Icon(
                        currentPage.value == Page.favorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: currentPage.value == Page.favorite
                            ? enableIconColor
                            : secondaryIconColor,
                        size: 35,
                      ),
                    ),
                    value: "0",
                    color: const Color(0xFFF0BF41),
                  ),
                  const Spacer(),
                  Obx(
                    () => FittedBox(
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
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 75,
            child: GestureDetector(
              onTap: () {
                currentPage.value = Page.wallet;
                // Get.toNamed(Routes.WALLET);
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Icon(
                        Icons.credit_card,
                        color: currentPage.value == Page.wallet
                            ? enableIconColor
                            : secondaryIconColor,
                        size: 35,
                      ),
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
                currentPage.value = Page.cart;
                Get.toNamed(Routes.CART);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBadge(
                    icon: Obx(
                      () => Icon(
                        currentPage.value == Page.cart
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                        color: currentPage.value == Page.cart
                            ? enableIconColor
                            : secondaryIconColor,
                        size: 35,
                      ),
                    ),
                    value: "0",
                    color: enableIconColor,
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
                currentPage.value = Page.orders;
                // Get.toNamed(Routes.ORDERS);
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Icon(
                        Icons.card_travel,
                        color: currentPage.value == Page.orders
                            ? enableIconColor
                            : secondaryIconColor,
                        size: 35,
                      ),
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
                currentPage.value = Page.home;
                Get.toNamed(Routes.HOME);
              },
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Icon(
                        currentPage.value == Page.home
                            ? Icons.home
                            : Icons.home_outlined,
                        color: currentPage.value == Page.home
                            ? enableIconColor
                            : secondaryIconColor,
                        size: 35,
                      ),
                    ),
                    const Spacer(),
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
        ],
      ),
    );
  }
}

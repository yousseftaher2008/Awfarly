import 'package:awfarly/app/shared/styles/colors.dart';
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
                Container(
                  height: pageHeight / 4,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      tileMode: TileMode.clamp,
                      colors: firstAppBarBackgroundColor,
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                ),
                const Text(
                  'CartView is working',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: const AppBottomSheet(),
    );
  }
}

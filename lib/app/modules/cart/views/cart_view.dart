import 'package:awfarly/app/shared/users_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

import 'package:get/get.dart';

import '../../../shared/app_bars.dart';
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
                firstAppBar(
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 20.0),
                        child: Row(
                          children: [
                            currentUserImage(),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: ColoredBox(
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "ابحث على ما تريد",
                                        hintStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        prefixIcon: IconButton(
                                            onPressed: () {},
                                            icon:
                                                const Icon(FontAwesome.search)),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              FontAwesome.microphone),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.qr_code_scanner,
                                color: Colors.white,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "عربة التسوق : ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Obx(() => Text(
                                "${controller.productCount} منتج",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ))
                        ],
                      ),
                    ],
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

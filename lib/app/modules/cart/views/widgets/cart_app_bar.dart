import 'package:flutter_svg/svg.dart';

import '../../../../shared/app_bars.dart';
import '../../../../shared/users_image.dart';
import '../../controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartFirstAppBar extends GetView<CartController> {
  const CartFirstAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Widget searchBarRow = Obx(
      () => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: !controller.isSearching.value
                ? currentUserImage()
                : GestureDetector(
                    onTap: () {
                      controller.isSearching.value = false;
                      controller.searchController.clear();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    ),
                  ),
          ),
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
                    onTap: () {
                      controller.isSearching.value = true;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "ابحث على ما تريد",
                      hintStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                      prefixIcon: IconButton(
                        onPressed: () {
                          if (controller.isSearching.value == false) {
                            controller.isSearching.value = true;
                          } else {
                            // TODO: searching  for the current element
                          }
                        },
                        icon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // TODO: open the microphone
                        },
                        icon: SvgPicture.asset("assets/icons/mic.svg"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                // TODO: check the qr_code
              },
              icon: SvgPicture.asset(
                "assets/icons/qr_code.svg",
                color:
                    controller.isSearching.value ? Colors.grey : Colors.white,
              ))
        ],
      ),
    );

    return Obx(
      () => controller.isSearching.value
          ? Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 25,
                right: 10,
                left: 10,
              ),
              child: searchBarRow,
            )
          : firstAppBar(
              SizedBox(
                height: 150,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    searchBarRow,
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 20.0),
                      child: Row(
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
                          Text(
                            "${controller.selectedProducts.length} منتج",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

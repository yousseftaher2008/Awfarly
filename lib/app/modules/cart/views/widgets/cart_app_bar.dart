import 'package:avatar_glow/avatar_glow.dart';
import 'package:awfarly/app/modules/cart/views/screens/qr_code.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/app_bars.dart';
import '../../../../shared/users_image.dart';
import '../../controllers/cart_controller.dart';

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
                    onTap: controller.backFromSearching,
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
                    controller: controller.searchController,
                    onTap: () {
                      controller.isSearching.value = true;
                    },
                    onChanged: controller.searchForElements,
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
                            FocusScope.of(context).unfocus();
                            controller.searchForElements(
                                controller.searchController.text);
                          }
                        },
                        icon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                      suffixIcon: Obx(
                        () => AvatarGlow(
                          endRadius: 15,
                          animate: controller.isListing.value,
                          duration: const Duration(milliseconds: 2000),
                          glowColor: Colors.black,
                          repeat: true,
                          repeatPauseDuration:
                              const Duration(milliseconds: 100),
                          showTwoGlows: true,
                          child: IconButton(
                            onPressed: controller.micFun,
                            icon: SvgPicture.asset("assets/icons/mic.svg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () async {
                Get.to(() => const QrCodeScreen());
                controller.isSearching.value = true;
              },
              icon: SvgPicture.asset(
                "assets/icons/qr_code.svg",
                // ignore: deprecated_member_use
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

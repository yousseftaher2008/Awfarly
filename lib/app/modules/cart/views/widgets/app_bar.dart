import '../../../../shared/app_bars.dart';
import '../../../../shared/users_image.dart';
import '../../controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartFirstAppBar extends GetView<CartController> {
  const CartFirstAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Widget searchBarRow = Row(
      children: [
        controller.isSearching.value
            ? currentUserImage()
            : IconButton(
                onPressed: () {
                  controller.isSearching.value = false;
                  controller.searchController.clear();
                },
                icon: const Icon(Icons.arrow_forward_ios),
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
                      icon: const SvgPicture.assets("assets/icons/search.png"),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        // TODO: open the microphone
                      },
                      icon: const SvgPicture.assets("assets/icons/mic.svg"),
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
            icon: const SvgPicture.assets("assets/icons/qr_code.svg"))
      ],
    );

    return Obx(
      () => controller.isSearching.value
          ? searchBarRow
          : firstAppBar(
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                        Obx(
                          () => Text(
                            "${controller.selectedProducts} منتج",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class SvgPicture extends Widget {
  const SvgPicture.assets(String assetUrl, {super.key});

  @override
  Element createElement() {
    throw UnimplementedError();
  }
}

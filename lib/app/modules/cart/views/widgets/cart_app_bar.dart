import 'package:avatar_glow/avatar_glow.dart';
import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:awfarly/app/modules/cart/views/screens/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: !controller.isSearching.value
                ? currentUserImage()
                : IconButton(
                    onPressed: controller.backFromSearching,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 24.sp,
                    ),
                  ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: 10.w,
                bottom: 10.h,
                top: 10.h,
                left: 0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                child: ColoredBox(
                  color: const Color(0xFFFFFFFF),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    controller: controller.searchController,
                    onChanged: controller.searchForElements,
                    onTap: () {
                      controller.isSearching.value = true;
                      controller.mainController.isShowBottomSheet.value = false;
                    },
                    onFieldSubmitted: (value) {
                      if (!controller.isGettingSearched.value) {
                        controller.searchForElements(value);
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "ابحث على ما تريد",
                      hintStyle:
                          h4RegularGrey.copyWith(fontWeight: FontWeight.w600),
                      prefixIcon: IconButton(
                        onPressed: () {
                          if (controller.isSearching.value == false) {
                            controller.isSearching.value = true;
                            controller.mainController.isShowBottomSheet.value =
                                false;
                          } else if (!controller.isGettingSearched.value) {
                            FocusScope.of(context).unfocus();
                            controller.searchForElements(
                              controller.searchController.text,
                            );
                          }
                        },
                        icon: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                      suffixIcon: AvatarGlow(
                        endRadius: 15.r,
                        animate: controller.isListing.value,
                        duration: const Duration(milliseconds: 2000),
                        glowColor: Colors.black,
                        repeat: true,
                        repeatPauseDuration: const Duration(milliseconds: 100),
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
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: IconButton(
              onPressed: () async {
                Get.to(() => const QrCodeScreen());
                controller.isSearching.value = true;
                controller.mainController.isShowBottomSheet.value = false;
              },
              icon: SvgPicture.asset(
                "assets/icons/qr_code.svg",
                // ignore: deprecated_member_use
                color:
                    controller.isSearching.value ? Colors.grey : Colors.white,
              ),
            ),
          )
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
              child: SizedBox(
                height: 150.h,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    searchBarRow,
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0.w,
                        right: 10.0.w,
                        bottom: 20.0.h,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Text(
                              "عربة التسوق : ",
                              style: h3BoldWhite,
                            ),
                          ),
                          Text(
                            "${controller.selectedProductsLen.value} منتج",
                            style: h3RegularWhite,
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

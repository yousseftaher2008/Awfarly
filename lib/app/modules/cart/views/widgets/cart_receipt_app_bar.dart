import 'package:awfarly/app/constants/screen_dimensions.dart';
import 'package:awfarly/app/constants/styles/button_styles.dart';
import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../shared/app_bars.dart';

class CartReceiptAppBar extends GetView<CartController> {
  const CartReceiptAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return secondAppBar(
      child: Stack(
        children: [
          Positioned(
            top: 50.h,
            left: 179.w,
            child: Center(
              child: SvgPicture.asset("assets/logo.svg"),
            ),
          ),
          Positioned(
            top: 100.h,
            right: 16.w,
            child: Text(
              "الفاتورة",
              style: h3BoldWhite,
            ),
          ),
          Positioned(
            top: 90.h,
            left: 16.w,
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                "هل انت متاكد من الغاء الفاتورة",
                                textAlign: TextAlign.right,
                                style: h3RegularBlack,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: mainButtonStyle,
                            onPressed: () {
                              controller.receipt = null;
                              Get.back();
                              Get.back();
                            },
                            child: Text(
                              "نعم",
                              style: h3BoldWhite,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          ElevatedButton(
                            style: mainButtonStyle.merge(
                              ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                  width: 2,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "لا",
                              style: h3BoldRed,
                            ),
                          ),
                          SizedBox(
                            height: 75.h,
                          )
                        ],
                      );
                    });
              },
              child: Text(
                "إلغاء",
                style: h4RegularRed,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Obx(
              () => Container(
                padding: EdgeInsets.all(10.sp),
                width: pageWidth(),
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: controller.isGettingBestReceipt.value
                      ? Colors.white
                      : successColor,
                ),
                child: controller.isGettingBestReceipt.value
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: LoadingAnimationWidget.hexagonDots(
                              color: primaryColor,
                              size: 35.h,
                            ),
                          ),
                          Text(
                            "جاري البحث عن افضل فاتورة تابعة لموزعينا",
                            style: h4RegularBlack,
                          ),
                        ],
                      )
                    : Text(
                        "تهانينا لقد حصلت على ارخص فاتورة من اوفر لي\nانت وفرت 30.00 ر.س",
                        style: h4RegularWhite,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

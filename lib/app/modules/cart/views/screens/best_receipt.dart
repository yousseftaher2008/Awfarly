import 'package:awfarly/app/constants/screen_dimensions.dart';
import 'package:awfarly/app/constants/styles/button_styles.dart';
import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:awfarly/app/modules/cart/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

import 'package:awfarly/app/modules/cart/views/widgets/cart_receipt_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BestReceipt extends GetView<CartController> {
  const BestReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: pageHeight(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const CartReceiptAppBar(),
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: SizedBox(
                  height: 40.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset("assets/icons/bag.svg"),
                      SizedBox(width: 5.w),
                      Text(
                        "طلباتك",
                        style: h4BoldBlack,
                      ),
                      const Spacer(),
                      Obx(
                        () => (!controller.isGettingBestReceipt.value)
                            ? TextButton(
                                onPressed: () {
                                  Get.back();
                                  controller.isSearching.value = true;
                                  controller.receipt = null;
                                },
                                child: const Text("اضافة منتج اخر"),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: 2.h),
            Expanded(
              child: ListView.builder(
                itemCount: controller.selectedProductsLen.value,
                shrinkWrap: true,
                padding: EdgeInsets.all(10.sp),
                itemBuilder: (_, i) => CartItem(
                  controller.selectedProducts[i],
                  asReceiptProduct: true,
                ),
              ),
            ),
            Obx(
              () => Column(
                children: [
                  Divider(thickness: 2.h),
                  ListTile(
                    title: Text(
                      "تكلفة طلباتك(${controller.selectedProductsLen.value} منتج)",
                      style: h3BoldBlack,
                    ),
                    subtitle: Text(
                      "الاسعار شاملة ضريبة القيمة المضافة",
                      style: h6Light,
                    ),
                    trailing: controller.isGettingBestReceipt.value
                        ? const SizedBox()
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${controller.receipt!.totalPrice}",
                                style: h3BoldBlack,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "ر.س",
                                style: h6RegularGrey,
                              ),
                            ],
                          ),
                  ),
                  ListTile(
                    title: Text(
                      "التوصيل خلال اليوم",
                      style: h3BoldBlack,
                    ),
                    subtitle: Text(
                      "من الساعة 1.00 م الى الساعة 6.00 م",
                      style: h6Light,
                    ),
                    trailing: controller.isGettingBestReceipt.value
                        ? const SizedBox()
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "12.00",
                                style: h3BoldBlack,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "ر.س",
                                style: h6RegularGrey,
                              ),
                            ],
                          ),
                  ),
                  Divider(thickness: 2.h),
                  Padding(
                    padding: EdgeInsets.all(15.0.sp),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "التكلفة الكلية",
                          style: h3BoldBlack,
                        ),
                        const Spacer(),
                        if (!controller.isGettingBestReceipt.value)
                          Text(
                            "${controller.receipt!.totalPrice + 12.0}",
                            style: h2Black,
                          ),
                        if (!controller.isGettingBestReceipt.value)
                          SizedBox(
                            width: 5.w,
                          ),
                        if (!controller.isGettingBestReceipt.value)
                          Text(
                            "ر.س",
                            style: h6RegularGrey,
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0.sp),
                    child: Center(
                      child: ElevatedButton(
                        style: mainButtonStyle,
                        onPressed: controller.isGettingBestReceipt.value
                            ? null
                            : () {},
                        child: Text(
                          "استمرار",
                          style: h4BoldWhite,
                        ),
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

// make the screen work correctly
import 'package:awfarly/app/constants/screen_dimensions.dart';
import 'package:awfarly/app/constants/styles/button_styles.dart';
import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset("assets/icons/bag.svg"),
                  const SizedBox(width: 5),
                  Text(
                    "طلباتك",
                    style: h4BoldBlack,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text("اضافة منتج اخر"),
                  )
                ],
              ),
            ),
            Divider(thickness: 2.h),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, i) {
                  return null;
                },
              ),
            ),
            Column(
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "24.00",
                        style: h3BoldBlack,
                      ),
                      const SizedBox(
                        width: 5,
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "12.00",
                        style: h3BoldBlack,
                      ),
                      const SizedBox(
                        width: 5,
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
                      Text(
                        "36.00",
                        style: h2Black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
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
                      onPressed: () {},
                      child: Text(
                        "استمرار",
                        style: h4BoldWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

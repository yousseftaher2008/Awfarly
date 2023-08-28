import 'package:awfarly/app/constants/styles/button_styles.dart';
import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DoneScreen extends GetView<CartController> {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80.h, bottom: 180.h),
              child: Text(
                "طلبك تم بنجاح",
                style: h4RegularGrey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0.h),
              child: Image.asset(
                "assets/done_image.png",
                height: 150,
                width: 175,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Text(
                "تهانينا",
                style: h1Black,
              ),
            ),
            Text(
              "تم قبول طلبك بنجاح",
              style: h4BoldBlack,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/ring.svg"),
                  SizedBox(width: 10.w),
                  Text(
                    "سوف يتم ارسال لك اشعار عندما يتم تسليم البضاعة",
                    style: h4RegularGrey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
              style: mainButtonStyle.merge(
                ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    width: 2,
                    color: primaryColor,
                  ),
                ),
              ),
              onPressed: () {
                Get.back();
                controller.clearAll();
              },
              child: Text(
                "استمر في التسوق",
                style: h3BoldPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

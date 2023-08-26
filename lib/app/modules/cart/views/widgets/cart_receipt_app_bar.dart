import 'package:awfarly/app/constants/screen_dimensions.dart';
import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../shared/app_bars.dart';

class CartReceiptAppBar extends StatelessWidget {
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
                // TODO: showBottomSheetDialog and close the reciept when accept
                Get.back();
              },
              child: Text(
                "إلغاء",
                style: h4RegularRed,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(10.sp),
              width: pageWidth(),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: successColor,
              ),
              child: Text(
                "تهانينا لقد حصلت على ارخص فاتورة من اوفر لي\nانت وفرت 30.00 ر.س",
                style: h4RegularWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

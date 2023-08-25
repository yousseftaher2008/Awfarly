// TODO: complete styles and add default ones
import 'package:awfarly/app/shared/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BestReceipt extends StatelessWidget {
  const BestReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          secondAppBar(
            child: Stack(
              children: [
                Center(
                  child: SvgPicture.asset("assets/logo.svg"),
                ),
                Positioned(
                  bottom: 30.h,
                  right: 25.w,
                  child: const Text(
                    "الفاتورة",
                  ),
                ),
                Positioned(
                  bottom: 30.h,
                  left: 25.w,
                  child: TextButton(
                    onPressed: () {
                      // TODO: close the reciept
                    },
                    child: const Text(
                      "إلغاء",
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

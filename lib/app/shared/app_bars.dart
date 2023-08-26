import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/styles/colors.dart';

Widget firstAppBar({required Widget child}) => Container(
      height: 220.h,
      padding: EdgeInsets.only(top: 30.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 0),
          end: Alignment(-1.15, -1.986),
          colors: appBarBackgroundColors,
          stops: <double>[0, 0.225, 0.393, 0.547, 0.785, 0.875, 1],
        ),
      ),
      child: child,
    );
Widget secondAppBar({required Widget child}) => Container(
      height: 250.h,
      padding: EdgeInsets.only(top: 30.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 0),
          end: Alignment(-1.15, -1.986),
          colors: appBarBackgroundColors,
          stops: <double>[0, 0.225, 0.393, 0.547, 0.785, 0.875, 1],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -40.h,
            left: 0,
            child: SvgPicture.asset(
              "assets/triangle.svg",
            ),
          ),
          Positioned(
            bottom: -80.h,
            left: 0,
            child: SvgPicture.asset(
              "assets/triangle.svg",
            ),
          ),
          Positioned(
            bottom: -120.h,
            left: 0,
            child: SvgPicture.asset(
              "assets/triangle.svg",
            ),
          ),
          child,
        ],
      ),
    );

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/styles/colors.dart';

Widget firstAppBar(Widget child) => Container(
      height: 220.h,
      padding: EdgeInsets.only(top: 30.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 0),
          end: Alignment(-1.15, -1.986),
          colors: firstAppBarBackgroundColors,
          stops: <double>[0, 0.225, 0.393, 0.547, 0.785, 0.875, 1],
        ),
      ),
      child: child,
    );

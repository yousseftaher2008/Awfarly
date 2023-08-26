import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screen_dimensions.dart';

ButtonStyle mainButtonStyle = ElevatedButton.styleFrom(
  fixedSize: Size(pageWidth() - 50.w, 50.h),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.r),
  ),
);

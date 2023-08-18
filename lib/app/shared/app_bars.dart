import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'styles/colors.dart';

double _pageHeight = Get.size.height;
Widget firstAppBar(Widget child) => Container(
      height: _pageHeight / 4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.clamp,
          colors: firstAppBarBackgroundColor,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: child,
    );

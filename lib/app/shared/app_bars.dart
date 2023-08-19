import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'styles/colors.dart';

double _pageHeight = Get.size.height;
Widget firstAppBar(Widget child) => Container(
      height: _pageHeight / 5 + 30,
      padding: const EdgeInsets.only(top: 30),
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

import 'dart:math';

import 'package:awfarly/app/constants/screen_dimensions.dart';
import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScreen extends GetView<CartController> {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar screenAppBar = AppBar(
      backgroundColor: primaryColorDarkThree,
      title: const Text("امسح QR Code"),
    );
    double qrCodeDimensions = min(pageHeight(), pageWidth() - 100.w);
    double heightWithoutQrCode = ((pageHeight() -
                MediaQuery.of(context).padding.top -
                screenAppBar.preferredSize.height) -
            qrCodeDimensions) /
        2;
    Color pageColor = Colors.black.withOpacity(0.5);
    final GlobalKey qrView = GlobalKey();
    return Scaffold(
      appBar: screenAppBar,
      body: Stack(
        children: [
          Center(
            child: QRView(key: qrView, onQRViewCreated: controller.checkQrCode),
          ),
          Container(
            color: pageColor,
            width: double.infinity,
            height: heightWithoutQrCode,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: pageColor,
              width: double.infinity,
              height: heightWithoutQrCode,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: pageColor,
              width: 50.w,
              height: qrCodeDimensions,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: pageColor,
              width: 50.w,
              height: qrCodeDimensions,
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: primaryColorDarkThree,
                  width: 4,
                ),
              ),
              height: qrCodeDimensions + 10.r,
              width: qrCodeDimensions + 10.r,
            ),
          ),
        ],
      ),
    );
  }
}

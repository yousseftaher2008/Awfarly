import 'dart:math';

import 'package:awfarly/app/constants/screen_dimensions.dart';
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScreen extends GetView<CartController> {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double qrCodeDimensions = min(pageHeight(), pageWidth());
    Color pageColor = Colors.black.withBlue(50).withGreen(50).withRed(50);
    final GlobalKey qrView = GlobalKey();
    return Scaffold(
      backgroundColor: pageColor,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: qrCodeDimensions,
              width: qrCodeDimensions,
              child:
                  QRView(key: qrView, onQRViewCreated: controller.checkQrCode),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

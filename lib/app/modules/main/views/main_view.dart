import 'package:awfarly/app/modules/cart/views/cart_view.dart';
import 'package:awfarly/app/modules/home/bindings/home_binding.dart';
import 'package:awfarly/app/modules/home/views/home_view.dart';
import 'package:awfarly/app/shared/app_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () {
          if (AppPages.currentPage.value == AppPagesEnum.cart) {
            return const CartView();
          } else {
            HomeBinding().dependencies();
            return const HomeView();
          }
        },
      ),
      bottomSheet: Obx(
        () => controller.isShowBottomSheet.value
            ? const AppBottomSheet()
            : const SizedBox(),
      ),
    );
  }
}

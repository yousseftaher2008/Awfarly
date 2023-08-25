import 'package:get/get.dart';

import '../modules/cart/views/cart_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

enum AppPagesEnum { home, orders, cart, wallet, favorite }

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.MAIN;

  static final Rx<AppPagesEnum> currentPage = AppPagesEnum.home.obs;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
  ];
}

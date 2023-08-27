// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const CART = _Paths.CART;
  static const MAIN = _Paths.MAIN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const CART = '/cart';
  static const MAIN = '/main';
}

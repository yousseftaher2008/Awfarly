import 'dart:async';

import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:awfarly/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../models/product.dart';

class CartController extends GetxController {
  final RxList<Product> selectedProducts = [
    Product(
      id: "p1",
      name: "first product",
      description: "this is a very good product",
      imageUrl:
          "https://www.pixelstalk.net/wp-content/uploads/2016/08/Fresh-hot-delicious-food-wallpaper.jpg",
      priceOne: 39.99,
      priceTwo: 49.99,
    ),
    Product(
      id: "p2",
      name: "second product",
      description: "this is a very good product",
      imageUrl:
          "https://www.pixelstalk.net/wp-content/uploads/2016/08/Fresh-hot-delicious-food-wallpaper.jpg",
      priceOne: 39.99,
      priceTwo: 49.99,
    ),
  ].obs;
  final RxList<Product> products = [
    Product(
      id: "p1",
      name: "first product",
      description: "this is a very good product",
      imageUrl:
          "https://www.pixelstalk.net/wp-content/uploads/2016/08/Fresh-hot-delicious-food-wallpaper.jpg",
      priceOne: 39.99,
      priceTwo: 49.99,
    ),
    Product(
      id: "p2",
      name: "second product",
      description: "this is a very good product",
      imageUrl:
          "https://www.pixelstalk.net/wp-content/uploads/2016/08/Fresh-hot-delicious-food-wallpaper.jpg",
      priceOne: 39.99,
      priceTwo: 49.99,
    ),
  ].obs;
  final RxList<Product> searchedProducts = RxList();
  final MainController mainController = Get.find<MainController>();
  final RxBool isSearching = false.obs;
  final RxBool isListing = false.obs;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController counterController = TextEditingController();
  final SpeechToText _speechToText = SpeechToText();
  Timer? _micTimer;

  void addProduct({String? id, Product? product}) {
    if (id != null) {
      Product selectProduct =
          selectedProducts.firstWhere((Product element) => element.id == id);
      if (selectProduct.count < 99) {
        selectProduct.count.value++;
      }
    } else if (product != null) {
      bool isFound = false;
      for (final Product selectedProduct in selectedProducts) {
        if (product.id != selectedProduct.id) continue;
        if (selectedProduct.count.value < 99) {
          selectedProduct.count.value++;
          isFound = true;
          break;
        }
      }
      if (!isFound) {
        selectedProducts.add(product);
      }
    }
  }

  void decreaseProductCount(String id) {
    int selectProductIndex =
        selectedProducts.indexWhere((Product element) => element.id == id);
    if (selectedProducts[selectProductIndex].count.value > 1) {
      selectedProducts[selectProductIndex].count.value--;
    }
  }

  void deleteProduct(String id) {
    selectedProducts.removeWhere((Product element) => element.id == id);
  }

  Future<void> getProducts() async {}

  void searchForElements(String value, [bool searchById = false]) {
    value = value.trim();

    if (value == "") {
      searchedProducts.clear();
      return;
    }
    searchedProducts.value = products
        .where(
          (Product product) =>
              searchById ? product.id == value : product.name.contains(value),
        )
        .toList();
  }

  void checkQrCode(QRViewController qrController) {
    qrController.scannedDataStream.listen((Barcode event) {
      if (event.code != null) {
        searchForElements(event.code!, true);
        if (searchedProducts.isNotEmpty) {
          searchController.text = searchedProducts.first.name;
          Get.back();
        } else {
          searchController.text = event.code!;
          Get.back();
        }
      }
    });
  }

  Future<void> micFun() async {
    isSearching.value = true;
    mainController.isShowBottomSheet.value = false;
    try {
      if (!isListing.value) {
        final bool isAvailableToListen = await _speechToText.initialize();
        if (isAvailableToListen) {
          _micTimer = Timer(const Duration(seconds: 3), () {
            isListing.value = false;
            _speechToText.stop();
          });
          isListing.value = true;
          _speechToText.listen(
            onResult: (result) {
              _micTimer?.cancel();
              _micTimer = Timer(const Duration(seconds: 3), () {
                isListing.value = false;
                _speechToText.stop();
              });
              searchController.text = result.recognizedWords;
              searchForElements(searchController.text);
            },
          );
        }
      } else {
        isListing.value = false;
        _speechToText.stop();
      }
    } on PlatformException {
      Get.snackbar(
        "فشل تسجيل الصوت",
        "جهازك لا يدعم تسجيل الصوت",
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primaryColor,
        margin: const EdgeInsets.all(10),
      );
    }
  }

  void backFromSearching() {
    mainController.isShowBottomSheet.value = true;
    isSearching.value = false;
    searchController.clear();
    searchedProducts.clear();
    isListing.value = false;
    _speechToText.stop();
    _micTimer?.cancel();
  }
}

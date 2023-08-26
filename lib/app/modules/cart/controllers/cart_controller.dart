import 'dart:async';
import 'dart:convert';

import 'package:awfarly/app/constants/base_url.dart';
import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:awfarly/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../models/product.dart';

class CartController extends GetxController {
  final List<Product> selectedProducts = [
    Product(
      id: "3",
      name: "hello",
      imageUrl:
          "https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141353.jpg",
      maxPrice: 199,
      minPrice: 99,
    )
  ];
  final RxInt selectedProductsLen = 0.obs;
  final List<Product> products = [];
  final RxInt productsLen = 0.obs;
  final List<Product> searchedProducts = [];
  final RxInt searchedProductsLen = 0.obs;
  final MainController mainController = Get.find<MainController>();
  final RxBool isSearching = false.obs;
  final RxBool isListing = false.obs;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController counterController = TextEditingController();
  final SpeechToText _speechToText = SpeechToText();
  Future? lastRequest;
  Timer? _micTimer;
  @override
  void onInit() {
    super.onInit();
    productsLen.value = products.length;
    searchedProductsLen.value = searchedProducts.length;
    selectedProductsLen.value = selectedProducts.length;
  }

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
        selectedProductsLen.value++;
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
    selectedProductsLen.value--;
  }

  Future<void> getProducts() async {}

  void searchForElements(String value) {
    searchedProducts.clear();
    value = value.trim();
    if (lastRequest != null) lastRequest!.ignore();
    if (value == "") return;

    Uri url = Uri.parse("$baseUrl/Products/GetAllProductsDropDown");
    Map<String, String> headers = {
      "Accept-Language": "application/json",
      "name": value
    };
    try {
      lastRequest = http.get(url, headers: headers).then((response) async {
        print(response.body);
        List? productData;
        try {
          productData = json.decode(response.body);
        } catch (e) {
          print(e);
        }
        if (productData != null && productData.isNotEmpty) {
          for (final product in productData) {
            searchedProducts.add(Product.fromJson(product));
          }
          searchedProductsLen.value = searchedProducts.length;
        }
        print(productData);
      });
    } catch (e) {
      print(e);
    }
  }

  void checkQrCode(QRViewController qrController) {
    qrController.scannedDataStream.listen((Barcode event) {
      if (event.code != null) {
        searchForElements(event.code!);
        searchController.text = event.code!;
        Get.back();
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
          _micTimer = Timer(const Duration(seconds: 5), () {
            isListing.value = false;
            _speechToText.stop();
          });
          isListing.value = true;
          _speechToText.listen(
            onResult: (result) {
              _micTimer?.cancel();
              _micTimer = Timer(const Duration(seconds: 5), () {
                isListing.value = false;
                _speechToText.stop();
              });
              searchController.text = result.recognizedWords;
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

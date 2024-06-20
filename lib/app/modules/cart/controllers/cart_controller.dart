import 'dart:async';

import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:awfarly/app/modules/cart/models/receipt.dart';
import 'package:awfarly/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../constants/styles/text_styles.dart';
import '../models/product.dart';

class CartController extends GetxController {
  final List<Product> selectedProducts = [], searchedProducts = [];

  final RxInt selectedProductsLen = 0.obs, searchedProductsLen = 0.obs;
  final MainController mainController = Get.find<MainController>();
  final RxBool isSearching = false.obs,
      isListing = false.obs,
      isGettingSearched = false.obs,
      isGettingBestReceipt = false.obs;
  final TextEditingController searchController = TextEditingController(),
      counterController = TextEditingController();
  final SpeechToText _speechToText = SpeechToText();
  Future? lastRequest;
  Timer? _micTimer;
  Receipt? receipt;
  @override
  void onInit() {
    super.onInit();
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
    searchedProductsLen.value = 0;
    // if (lastRequest != null) lastRequest!.ignore();
    if (value == "") return;

    isGettingSearched.value = true;
    final List<Product> localProductsData = [
      Product(
        id: "p1",
        name: "أرز فاخر",
        imageUrl: null,
        maxPrice: 80,
        minPrice: 70,
      ),
      Product(
        id: "p2",
        name: "أرز فاخر - ابو كاس",
        imageUrl: null,
        maxPrice: 80,
        minPrice: 70,
      ),
      Product(
        id: "p3",
        name: "أرز فاخر - شعلان",
        imageUrl: null,
        maxPrice: 80,
        minPrice: 70,
      ),
      Product(
        id: "p4",
        name: "test1",
        imageUrl: null,
        maxPrice: 80,
        minPrice: 70,
      ),
      Product(
        id: "p5",
        name: "test2",
        imageUrl: null,
        maxPrice: 80,
        minPrice: 70,
      ),
      Product(
        id: "p6",
        name: "test3",
        imageUrl: null,
        maxPrice: 80,
        minPrice: 70,
      ),
    ];
    searchedProducts.clear();
    searchedProducts.addAll(
      localProductsData.where(
        (element) => element.name.startsWith(value),
      ),
    );
    Future.delayed(
      const Duration(seconds: 1),
    ).then((value) {
      searchedProductsLen.value = searchedProducts.length;

      isGettingSearched.value = false;
    });

    // Uri url = Uri.parse("$baseApiUrl/Products/GetAllProducts?name=$value");
    // Map<String, String> headers = {
    //   "Accept-Language": "application/json",
    // };
    // try {
    //   print("start");
    //   lastRequest = http.get(url, headers: headers);
    //   lastRequest!.then((response) async {
    //     print(response.statusCode);
    //     List? productData;
    //     searchedProducts.clear();
    //     productData = json.decode(response.body);
    //     if (productData != null && productData.isNotEmpty) {
    //       for (final product in productData) {
    //         searchedProducts.add(Product.fromJson(product));
    //       }
    //       searchedProductsLen.value = searchedProducts.length;
    //     }
    //     isGettingSearched.value = false;
    //   }).catchError((e) {
    //     isGettingSearched.value = false;
    //     print("is $e");
    //   });
    // } catch (e) {
    //   print(e);
    //   isGettingSearched.value = false;
    //   return;
    // }
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
    isGettingSearched.value = false;
    searchController.clear();
    searchedProducts.clear();
    searchedProductsLen.value = 0;
    isListing.value = false;
    _speechToText.stop();
    _micTimer?.cancel();
  }

  Future<void> getBestReceipt() async {
    try {
      isGettingBestReceipt.value = true;
      double maxPrice = 0;
      double totalPrice = 0;
      for (var product in selectedProducts) {
        totalPrice += product.minPrice * product.count.value;
        maxPrice += product.maxPrice * product.count.value;
        product.finalPrice = product.minPrice;
      }
      receipt = Receipt(
        storeName: "متجر",
        totalPrice: totalPrice,
        savedPrice: maxPrice - totalPrice,
      );
      isGettingBestReceipt.value = false;
      // Uri url = Uri.parse("$baseApiUrl/Cart/CheckCart");
      // Map<String, String> headers = {
      //   "Content-Type": "application/json",
      //   "Accept-language": "ar",
      // };
      // List<Map> productList = [];
      // for (final product in selectedProducts) {
      //   productList
      //       .add({"productId": product.id, "quantity": product.count.value});
      // }

      // final String responseBody = json.encode(productList);

      // final response =
      //     await http.post(url, body: responseBody, headers: headers);
      // if (response.statusCode == 200) {
      //   final responseData = json.decode(response.body);
      //   return;
      // }
      // // if (response.statusCode == 404) {
      //   await Get.defaultDialog(
      //     title: "",
      //     middleText: "كل هذه المنتجات غير موجودة في متجر واحد",
      //     middleTextStyle: h4RegularPrimary,
      //     barrierDismissible: false,
      //     contentPadding: const EdgeInsets.all(15),
      //     confirm: ElevatedButton(
      //       style: ElevatedButton.styleFrom(
      //           backgroundColor: Colors.white,
      //           side: const BorderSide(color: primaryColor, width: 1)),
      //       onPressed: () {
      //         Get.back();
      //       },
      //       child: const Text("العودة", style: h5RegularPrimary),
      //     ),
      //   );

      // Get.back();
      // isGettingBestReceipt.value = false;
      // return;
      // }
    } catch (e) {
      await Get.defaultDialog(
        title: "",
        middleText: "كل هذه المنتجات غير موجودة في متجر واحد",
        middleTextStyle: h4RegularPrimary,
        barrierDismissible: false,
        contentPadding: const EdgeInsets.all(15),
        confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: primaryColor, width: 1)),
          onPressed: () {
            Get.back();
          },
          child: const Text("العودة", style: h5RegularPrimary),
        ),
      );
      Get.back();
      isGettingBestReceipt.value = false;
    }
    // Get.back();
    // isGettingBestReceipt.value = false;
  }

  void clearAll() {
    selectedProducts.clear();
    searchedProducts.clear();
    _micTimer = null;
    receipt = null;
    mainController.isShowBottomSheet.value;
    selectedProductsLen.value = 0;
    searchedProductsLen.value = 0;
  }
}

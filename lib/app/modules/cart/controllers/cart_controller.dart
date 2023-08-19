import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/products.dart';

class CartController extends GetxController {
  final RxList<Product> selectedProducts = [
    Product(
      id: "p1",
      name: "first product",
      description: "this is a very good product",
      imageUrl:
          "https://www.pixelstalk.net/wp-content/uploads/2016/08/Fresh-hot-delicious-food-wallpaper.jpg",
      price: 33.99,
    )
  ].obs;
  final RxList<Product> products = RxList();
  final RxBool isSearching = false.obs;
  final TextEditingController searchController = TextEditingController();

  void addProduct([String? id, Product? product]) {
    if (id != null) {
      Product selectProduct =
          selectedProducts.firstWhere((Product element) => element.id == id);
      selectProduct.count.value++;
    } else if (product != null) {
      selectedProducts.add(product);
    }
  }

  void decreaseProductCount(String id) {
    int selectProductIndex =
        selectedProducts.indexWhere((Product element) => element.id == id);
    if (selectedProducts[selectProductIndex].count.value == 1) {
      selectedProducts.removeAt(selectProductIndex);
      return;
    }
    selectedProducts[selectProductIndex].count.value--;
  }

  void deleteProduct(String id) {
    selectedProducts.removeWhere((Product element) => element.id == id);
  }

  Future<void> getProducts() async {}
}

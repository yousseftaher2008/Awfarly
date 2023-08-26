import 'package:get/get.dart';

class Product {
  late final String id, name;
  late final String? imageUrl;
  late final double maxPrice, minPrice;
  late final RxInt count = 1.obs;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.maxPrice,
    required this.minPrice,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["ProductName"];
    imageUrl = json["Image"];
    maxPrice = json["MaxPrice"];
    minPrice = json["MinPrice"];
  }
}

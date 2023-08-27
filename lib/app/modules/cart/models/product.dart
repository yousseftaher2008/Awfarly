import 'package:awfarly/app/constants/base_url.dart';
import 'package:get/get.dart';

class Product {
  late final String id, name;
  late final String? imageUrl;
  late final double maxPrice, minPrice;
  double? finalPrice;
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
    name = json["productName"];
    imageUrl = json["image"] == null ||
            json["image"].isEmpty ||
            json["image"] == "string" ||
            !(json["image"] as String).isURL
        ? null
        : json["image"][0] == "/"
            ? "$baseImageUrl${json["image"]}"
            : json["image"];
    maxPrice = json["maxPrice"] ?? json["defaultPrice"] + 3;
    minPrice = json["minPrice"] ?? maxPrice - 6;
  }
}

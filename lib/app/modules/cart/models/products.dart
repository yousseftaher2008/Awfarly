import 'package:get/get.dart';

class Product {
  final String id, name, description, imageUrl;
  final double price;
  final RxInt count = 1.obs;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

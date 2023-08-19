// TODO: check the style and add the text limit
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:awfarly/app/modules/cart/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends GetView<CartController> {
  const CartItem(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   leading: ConstrainedBox(
    //     constraints: const BoxConstraints(maxWidth: 60),
    //     child: Image.network(product.imageUrl),
    //   ),
    //   title: Text(product.name),
    //   subtitle: Text(product.price.toString()),
    //   trailing: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         IconButton(
    //           onPressed: () => controller.deleteProduct(product.id),
    //           icon: const Icon(Icons.delete),
    //         ),
    //         Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             IconButton(
    //               onPressed: () => controller.addProduct(product.id),
    //               icon: const Icon(Icons.add, weight: 20),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text(product.count.toString()),
    //             ),
    //             IconButton(
    //               onPressed: () => controller.addProduct(product.id),
    //               icon: const Icon(Icons.add, weight: 20),
    //             )
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
    return Container();
  }
}

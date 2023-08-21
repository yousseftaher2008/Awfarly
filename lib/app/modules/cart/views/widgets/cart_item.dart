// TODO: check the text limit and the mediaQurey
import 'package:awfarly/app/constants/screen_dimensions.dart';
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:awfarly/app/modules/cart/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartItem extends GetView<CartController> {
  const CartItem(this.product, {this.asSearchProduct = false, super.key});
  final Product product;
  final bool asSearchProduct;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: asSearchProduct ? null : BorderRadius.circular(23),
        border: asSearchProduct
            ? const Border(
                bottom: BorderSide(color: Color(0xFFDDDDDD), width: 2))
            : Border.all(
                color: const Color(0xffdddddd),
                width: 1,
              ),
        color: const Color(0xffffffff),
        boxShadow: asSearchProduct
            ? null
            : const [
                BoxShadow(
                  color: Color(0x26000000),
                  offset: Offset(0, 6),
                  blurRadius: 20,
                ),
              ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: asSearchProduct ? null : const EdgeInsets.only(top: 10),
      // height: 120,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.right,
                ),
              ),
              // const Spacer()
              // else
              if (asSearchProduct)
                const SizedBox(
                  height: 10,
                ),
              if (!asSearchProduct)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "السعر يتراوح بين",
                    textAlign: TextAlign.right,
                  ),
                ),
              Row(
                children: [
                  FittedBox(
                    child: Text(
                      " ${product.priceTwo} - ${product.priceOne} ",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: pageWidth() < 350
                            ? 14
                            : pageWidth() < 450
                                ? 16
                                : 18,
                      ),
                    ),
                  ),
                  const Text("ر.س"),
                ],
              )
            ],
          ),
          const Spacer(),
          if (!asSearchProduct)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => controller.deleteProduct(product.id),
                    icon: SvgPicture.asset("assets/icons/trash.svg"),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFF3F7FC),
                        child: IconButton(
                            onPressed: () =>
                                controller.addProduct(id: product.id),
                            icon: const Icon(Icons.add)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Obx(
                          () => Text(
                            product.count.value.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: const Color(0xFFF3F7FC),
                        child: IconButton(
                            onPressed: () =>
                                controller.decreaseProductCount(product.id),
                            icon: const Icon(Icons.remove)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          if (!asSearchProduct)
            const ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2),
                  bottomRight: Radius.circular(2)),
              child: ColoredBox(
                color: Color(0xFF9FCEEF),
                child: SizedBox(
                  width: 5,
                  height: 50,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

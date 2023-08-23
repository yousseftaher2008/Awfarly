// TODO: check the text limit and the mediaQurey
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:awfarly/app/modules/cart/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        borderRadius: asSearchProduct ? null : BorderRadius.circular(23.r),
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
            : [
                BoxShadow(
                  color: const Color(0x26000000),
                  offset: const Offset(0, 6),
                  blurRadius: 20.r,
                ),
              ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      margin: asSearchProduct ? null : EdgeInsets.only(top: 10.h),
      // height: 120,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                height: 65.h,
                width: 50.w,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              // const Spacer()
              // else
              if (asSearchProduct)
                SizedBox(
                  height: 10.h,
                ),
              if (!asSearchProduct)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "السعر يتراوح بين",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF7E828E)),
                  ),
                ),
              Row(
                children: [
                  FittedBox(
                    child: Text(
                      " ${product.priceTwo} - ${product.priceOne} ",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Text(
                    "ر.س",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF7E828E)),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          if (!asSearchProduct)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
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
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: const Color(0xFFF3F7FC),
                        child: IconButton(
                          onPressed: () =>
                              controller.decreaseProductCount(product.id),
                          icon: const Icon(Icons.remove),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          if (!asSearchProduct)
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2.r),
                  bottomRight: Radius.circular(2.r)),
              child: ColoredBox(
                color: const Color(0xFF9FCEEF),
                child: SizedBox(
                  width: 5.w,
                  height: 50.h,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

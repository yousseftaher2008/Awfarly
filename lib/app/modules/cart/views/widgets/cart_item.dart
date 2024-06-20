import 'package:awfarly/app/constants/styles/colors.dart';
import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:awfarly/app/modules/cart/controllers/cart_controller.dart';
import 'package:awfarly/app/modules/cart/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartItem extends GetView<CartController> {
  const CartItem(this.product,
      {this.asSearchProduct = false, this.asReceiptProduct = false, super.key});
  final Product product;
  final bool asSearchProduct;
  final bool asReceiptProduct;
  @override
  Widget build(BuildContext context) {
    final TextEditingController counterController = TextEditingController(
      text: product.count.value.toString(),
    );
    void onCounterSave([String? value]) {
      if (counterController.text == "") {
        counterController.text = product.count.value.toString();
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: asSearchProduct ? null : BorderRadius.circular(23.r),
        border: asSearchProduct
            ? const Border(
                bottom: BorderSide(color: Color(0xFFDDDDDD), width: 2))
            : Border.all(
                color: const Color(0xFFDDDDDD),
                width: 1,
              ),
        color: const Color(0xFFFFFFFF),
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
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: product.imageUrl == null
                  ? Image.asset(
                      "assets/unknown_product_image.jpg",
                      fit: BoxFit.cover,
                      height: 65.h,
                      width: 50.w,
                    )
                  : FadeInImage(
                      placeholder:
                          const AssetImage("assets/unknown_product_image.jpg"),
                      image: NetworkImage(product.imageUrl!),
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
                  style: h4RegularBlack,
                  textAlign: TextAlign.right,
                ),
              ),
              if (asSearchProduct)
                SizedBox(
                  height: 10.h,
                ),
              if (!asSearchProduct && !asReceiptProduct)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "السعر يتراوح بين",
                    textAlign: TextAlign.right,
                    style: h6Light,
                  ),
                ),
              if (!asReceiptProduct)
                Row(
                  children: [
                    Text(
                      " ${product.maxPrice} - ${product.minPrice} ",
                      style: h4BoldBlack.copyWith(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "ر.س",
                      style: h6Light,
                    ),
                  ],
                )
              else
                Text(
                  "عدد: ${product.count}",
                  style: h5RegularGrey,
                ),
            ],
          ),
          const Spacer(),
          if (!asSearchProduct)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: asReceiptProduct
                  ? Obx(
                      () => controller.isGettingBestReceipt.value
                          ? const SizedBox()
                          : Row(
                              children: [
                                Text(
                                  "${product.finalPrice}",
                                  style: h4BoldBlack.copyWith(
                                      fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "ر.س",
                                  style: h6Light,
                                ),
                              ],
                            ),
                    )
                  : Column(
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
                                  onPressed: () {
                                    controller.addProduct(id: product.id);
                                    counterController.text =
                                        product.count.value.toString();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: primaryColor,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13.w),
                              child: SizedBox(
                                width: 20.w,
                                child: TextFormField(
                                  cursorColor: primaryColor,
                                  controller: counterController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 2,
                                  cursorWidth: 1,
                                  onChanged: (value) {
                                    if (value.isEmpty) return;
                                    if (value[0] == "0") {
                                      counterController.text =
                                          value.replaceFirst("0", "");
                                      return;
                                    }
                                    product.count.value =
                                        int.tryParse(counterController.text) ??
                                            product.count.value;
                                  },
                                  onSaved: onCounterSave,
                                  onFieldSubmitted: onCounterSave,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]"),
                                    ),
                                  ],
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    counterText: "",
                                  ),
                                  style: h3RegularBlack,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: const Color(0xFFF3F7FC),
                              child: IconButton(
                                onPressed: () {
                                  controller.decreaseProductCount(product.id);
                                  counterController.text =
                                      product.count.value.toString();
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
            ),
          if (!asSearchProduct && !asReceiptProduct)
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2.r),
                  bottomRight: Radius.circular(2.r)),
              child: ColoredBox(
                color: primaryColorLightThree,
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

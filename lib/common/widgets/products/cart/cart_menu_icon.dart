import 'package:clickcompras/features/shop/controllers/product/cart_controller.dart';
import 'package:clickcompras/features/shop/screens/cart/cart.dart';
import 'package:clickcompras/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,

    required this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()) , icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? Colors.white : Colors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Obx(
                        () => Text(controller.noOfCartItems.value.toString(),
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: counterTextColor ?? (dark ? Colors.black : Colors.white),
                            fontSizeFactor: 0.8)))),
          ),
        ),
      ],
    );
  }
}
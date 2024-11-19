import 'package:clickcompras/common/widgets/icons/t_circular_icon.dart';
import 'package:clickcompras/common/widgets/texts/product_price_text.dart';
import 'package:clickcompras/common/widgets/texts/product_title_text.dart';
import 'package:clickcompras/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:clickcompras/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:clickcompras/features/shop/screens/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Carrinho',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        // Nothing Found Widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Ops. O carrinho está vazio!',
          animation: TImages.cartAnimation,
          showAction: true,
          actionText: "Vamos escolher algumas coisas.",
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),


              child: TCartItems(),
            ),
          );
        }
      }
      ),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: Obx(() => Text('Total: R\$${controller.totalCartPrice.value}'))),
      ),
    );
  }
}

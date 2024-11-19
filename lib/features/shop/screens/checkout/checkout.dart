import 'package:clickcompras/common/widgets/images/rounded_container.dart';
import 'package:clickcompras/common/widgets/products/cart/cart_item.dart';
import 'package:clickcompras/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:clickcompras/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:clickcompras/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:clickcompras/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:clickcompras/navigation_menu.dart';
import 'package:clickcompras/utils/constants/colors.dart';
import 'package:clickcompras/utils/constants/image_strings.dart';
import 'package:clickcompras/utils/helpers/pricing_calculator.dart';
import 'package:clickcompras/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/product/cart_controller.dart';
import '../../controllers/product/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPrincingCalculator.calculateTotalPrice(subTotal, 'BR');

    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Ordem de compra',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TCartItems(showAddRemoveButtons: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            const TCouponCode(),
            const SizedBox(height: TSizes.spaceBtwSections),

            TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.black : TColors.white,
              child: const Column(
                children: [
                  TBillingAmountSection(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  Divider(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  TBillingPaymentSection(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  TBillingAddressSection(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : () => TLoaders.warningSnackBar(title: 'Carrinho vazio', message: 'Adicione itens ao carrinho para processar a ordem de compra.'),
          child: Text('Total: R\$${TPrincingCalculator.calculateTotalPrice(subTotal, 'BR')}'),
        ),
      ),
    );
  }
}

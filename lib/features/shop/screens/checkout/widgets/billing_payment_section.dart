import 'package:clickcompras/features/shop/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../common/widgets/images/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/checkout_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product/checkout_controller.dart';
import '../../../models/payment_selection_screen.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

    return Column(
      children: [
        TSectionHeading(
          title: 'Método de pagamento',
          buttonTitle: 'Alterar',
          onPressed: () {
            // Navegar para a tela de seleção de método de pagamento
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentSelectionScreen(),
              ),
            );
          },
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Obx(
              () => Row(
            children: [
              // Exibir o método de pagamento selecionado
              Image.asset(
                controller.selectedPaymentMethod.value.image,
                width: 60,
                height: 35,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}



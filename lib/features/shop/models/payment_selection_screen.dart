import 'package:clickcompras/features/shop/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../controllers/product/checkout_controller.dart';

class PaymentSelectionScreen extends StatelessWidget {
  const PaymentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();

    final paymentMethods = [
      PaymentMethodModel(name: 'Master Card', image: TImages.masterCard),
      PaymentMethodModel(name: 'Google Pay', image: TImages.googlePay),
      PaymentMethodModel(name: 'Visa', image: TImages.visa),
      PaymentMethodModel(name: 'Paypal', image: TImages.paypal),
      PaymentMethodModel(name: 'Cartão de crédito', image: TImages.creditCard),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione o método de pagamento'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Voltar para a tela anterior
          },
        ),
      ),
      body: ListView.builder(
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          final method = paymentMethods[index];
          return ListTile(
            leading: Image.asset(method.image, width: 50, height: 50),
            title: Text(method.name),
            onTap: () {
              // Atualizar o método de pagamento no controller
              controller.selectedPaymentMethod.value = method;
              Navigator.pop(context); // Voltar para a tela anterior
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:clickcompras/features/personalization/controllers/address_controller.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Endereço de envio',
          buttonTitle: 'Alterar',
          onPressed: () => addressController.selectNewAddressPopup(context),
        ),
        Obx(() {
          final selectedAddress = addressController.selectedAddress.value;
          if (selectedAddress.id.isEmpty) {
            return Text(
              'Selecione o endereço',
              style: Theme.of(context).textTheme.bodyMedium,
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedAddress.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Text(
                    selectedAddress.phoneNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.location_history, color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: Text(
                      '${selectedAddress.street}, ${selectedAddress.numberHouse}, ${selectedAddress.city}, ${selectedAddress.state} - ${selectedAddress.country}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}

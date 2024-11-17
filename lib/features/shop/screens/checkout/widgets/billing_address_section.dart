import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Endereço de envio', buttonTitle: 'Alterar', onPressed: () {}),
        Text('Rafael de Araujo', style: Theme
            .of(context)
            .textTheme
            .bodyLarge),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('+55 (47) 98447-0854', style: Theme
                .of(context)
                .textTheme
                .bodyMedium),
          ],
        ), // Row
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: Text(
                  'Rua Alberto Muller, 984, Limeira Baixa, Brusque - SC, BR',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium, softWrap: true),
            ),
          ],
        ),
      ],
    );
  }
}
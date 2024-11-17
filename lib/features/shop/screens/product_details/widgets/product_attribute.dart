import 'package:clickcompras/common/widgets/images/rounded_container.dart';
import 'package:clickcompras/common/widgets/texts/product_price_text.dart';
import 'package:clickcompras/common/widgets/texts/product_title_text.dart';
import 'package:clickcompras/features/shop/controllers/product/variation_controller.dart';
import 'package:clickcompras/features/shop/models/product_model.dart';
import 'package:clickcompras/utils/constants/colors.dart';
import 'package:clickcompras/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/chips/choice_chips.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: TSizes.spaceBtwItems),
                      const TSectionHeading(title: 'Variação', showActionButton: false),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(title: 'Preço: ', smallSize: true),
                              Text(
                                'R\$${controller.selectedVariation.value.price}',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(width: TSizes.spaceBtwItems),
                              TProductPriceText(price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              const TProductTitleText(title: 'Estoque: ', smallSize: true),
                              Text(controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  TProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TSectionHeading(title: attribute.name ?? '', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Obx(
                      () => Wrap(
                      spacing: 8,
                      children: attribute.values!
                          .map((attributeValue) {
                        final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                        final available = controller
                            .getAttributesAvailabilityInVariation(
                          product.productVariations!,
                          attribute.name!,
                        ).contains(attributeValue);

                        return TChoiceChip(
                            text: attributeValue,
                            selected: isSelected,
                            onSelected: available
                                ? (selected) {
                              if (selected && available) {
                                controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                              }
                            }
                            : null);
                      }).toList()),
                ),
              ],
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
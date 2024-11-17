import 'package:clickcompras/common/widgets/texts/section_heading.dart';
import 'package:clickcompras/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:clickcompras/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:clickcompras/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:clickcompras/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:clickcompras/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:clickcompras/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:clickcompras/utils/constants/enums.dart';
import 'package:clickcompras/utils/constants/sizes.dart';
import 'package:clickcompras/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../models/product_model.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen ({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(product: product),

            Padding(padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const TRatingAndShare(),

                  TProductMetaData(product: product),

                  if (product.productType == ProductType.variable.toString()) TProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwSections),


                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Escolher'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  const TSectionHeading(title: 'Descrição', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Expandir',
                    trimExpandedText: 'Diminuir',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Analises (199)', showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),)
          ],
        ),
      ),
    );
  }
}
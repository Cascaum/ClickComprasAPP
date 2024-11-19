import 'package:clickcompras/common/widgets/layouts/grid_layout.dart';
import 'package:clickcompras/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:clickcompras/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:clickcompras/common/widgets/texts/section_heading.dart';
import 'package:clickcompras/features/shop/screens/all_products/all_product.dart';
import 'package:clickcompras/features/shop/screens/store/widgets/category_brands.dart';
import 'package:clickcompras/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/category_controller.dart';
import '../../../models/category_model.dart';
import '../../../models/product_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              CategoryBrands(category: category),
              const SizedBox(height: TSizes.spaceBtwItems),

              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {

                  final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const TVerticalProductShimmer());
                  if (response != null) return response;

                  final products = snapshot.data!;

                  return Column(
                    children: [
                      TSectionHeading(
                        title: 'Você pode gostar',
                        onPressed: () => Get.to(AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TGridLayout(itemCount: products.length, itemBuilder: (_, index) => TProductCardVertical(product: products[index])),
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}
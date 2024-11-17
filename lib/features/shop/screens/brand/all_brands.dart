import 'package:clickcompras/common/widgets/products/sortable/sortable_products.dart';
import 'package:clickcompras/features/shop/controllers/brand_controller.dart';
import 'package:clickcompras/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/brands/brands_shimmer.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: const TAppBar(title: Text('Marcas'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              const TSectionHeading(title: 'Marcas Disponíveis', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Brands
              Obx(() {
                    if (brandController.isLoading.value) return const TBrandsShimmer();

                    if (brandController.allBrands.isEmpty) {
                      return Center(child: Text('Dados não encontrados!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)));
                    }
                    return TGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];
                        return TBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand : brand)),
                        );
                      },
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
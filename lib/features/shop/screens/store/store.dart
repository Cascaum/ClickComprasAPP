import 'package:clickcompras/common/widgets/appbar/appbar.dart';
import 'package:clickcompras/common/widgets/appbar/tabbar.dart';
import 'package:clickcompras/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:clickcompras/common/widgets/layouts/grid_layout.dart';
import 'package:clickcompras/common/widgets/brands/brand_card.dart';
import 'package:clickcompras/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:clickcompras/features/shop/controllers/category_controller.dart';
import 'package:clickcompras/features/shop/controllers/brand_controller.dart';
import 'package:clickcompras/features/shop/screens/brand/brand_products.dart';
import 'package:clickcompras/features/shop/screens/store/widgets/category_tab.dart';
import 'package:clickcompras/utils/constants/colors.dart';
import 'package:clickcompras/utils/constants/sizes.dart';
import 'package:clickcompras/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clickcompras/features/shop/screens/all_products/all_product.dart';

import '../../../../common/widgets/brands/brands_shimmer.dart';
import '../../models/brand_model.dart';
import '../brand/all_brands.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final theme = Theme.of(context);

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Lojas',
            style: theme.textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: theme.brightness == Brightness.dark ? Colors.white : Colors.black,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Procure na loja',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Destaques',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () => Get.to(() => const AllBrandsScreen()),
                            child: const Text(
                              'Ver tudo',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      Obx(
                            () {
                          if (brandController.isLoading.value) return const TBrandsShimmer();

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text(
                                'Dados não encontrados!',
                                style: theme.textTheme.bodyMedium!.apply(color: TColors.white),
                              ),
                            );
                          }
                          return TGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];
                              return TBrandCard(
                                showBorder: true,
                                brand: brand,
                                onTap: () => Get.to(() => BrandProducts(brand: brand)));
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}

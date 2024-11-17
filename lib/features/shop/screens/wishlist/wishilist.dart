import 'package:clickcompras/common/widgets/appbar/appbar.dart';
import 'package:clickcompras/common/widgets/icons/t_circular_icon.dart';
import 'package:clickcompras/common/widgets/layouts/grid_layout.dart';
import 'package:clickcompras/common/widgets/products/favourite_icon/favourites_controller.dart';
import 'package:clickcompras/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:clickcompras/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:clickcompras/features/shop/screens/home/home.dart';
import 'package:clickcompras/features/shop/screens/store/store.dart';
import 'package:clickcompras/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../models/product_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Salvos', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
                () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                const loader = TVerticalProductShimmer(itemCount: 6);

                final emptyWidget = TAnimationLoaderWidget(
                  text: 'Eita! Você não possui nenhum item salvo.',
                  animation: TImages.pencilAnimation,
                  showAction: true,
                  actionText: "Que tal ir nas lojas adicionar alguns produtos?",
                  onActionPressed: () {
                    final navigationController = Get.find<NavigationController>();
                    navigationController.selectedIndex.value = 1; // Vai para "Lojas"
                  },
                );

                final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: emptyWidget,
                );

                if (widget != null) return widget;

                final products = snapshot.data!;
                return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

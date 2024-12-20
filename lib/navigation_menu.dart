import 'package:clickcompras/features/shop/screens/home/home.dart';
import 'package:clickcompras/features/shop/screens/store/store.dart';
import 'package:clickcompras/utils/constants/colors.dart';
import 'package:clickcompras/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/personalization/screens/settings/settings.dart';
import 'features/shop/screens/wishlist/wishilist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
              backgroundColor: darkMode ? TColors.black : Colors.white,
              indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
                NavigationDestination(icon: Icon(Iconsax.shop), label: 'Lojas'),
                NavigationDestination(
                    icon: Icon(Iconsax.heart), label: 'Salvos'),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: 'Perfil'),
              ],
            ), // NavigationBar
      ), // Obx
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    ); // Scaffold
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), const StoreScreen(), const FavouriteScreen(), const SettingsScreen()];
}

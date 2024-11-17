import 'package:clickcompras/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:clickcompras/utils/constants/sizes.dart';
import 'package:clickcompras/utils/device/device.utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX para navegação

import '../../../../../navigation_menu.dart'; // Importe a tela de menu

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => Get.offAll(() => const NavigationMenu()), // Navegação direta para o menu
        child: const Text('Pular'),
      ),
    );
  }
}

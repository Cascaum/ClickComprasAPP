import 'package:clickcompras/common/widgets/appbar/appbar.dart';
import 'package:clickcompras/common/widgets/texts/section_heading.dart';
import 'package:clickcompras/features/personalization/controllers/user_controller.dart';
import 'package:clickcompras/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:clickcompras/common/widgets/shimmers/shimmer.dart';
import 'package:clickcompras/utils/constants/image_strings.dart';
import 'package:clickcompras/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/images/t_circular_image.dart';
import 'widgets/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Perfil')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isEmpty ? TImages.user : networkImage;

                      return controller.imageUploading.value ? const TShimmerEffect(width: 80, height: 80, radius: 80):
                      TCircularImage(
                        image: image,
                        width: 100,
                        height: 100,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
                    }),
                    TextButton(onPressed: () => controller.uploadProfilePicture(), child: const Text('Alterar foto de perfil')),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(title: 'Informações do perfil', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Nome', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              TProfileMenu(title: 'Usuário', value: controller.user.value.username, onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: 'Informações pessoais', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'user ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: (){}),
              TProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: (){}),
              TProfileMenu(title: 'N. telefone', value: controller.user.value.phoneNumber, onPressed: (){}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(), child: const Text('Excluir conta', style: TextStyle(color: Colors.red),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:clickcompras/features/personalization/controllers/user_controller.dart';
import 'package:clickcompras/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(() {
      // Observa as alterações na imagem de perfil do usuário
      final networkImage = controller.user.value.profilePicture;
      final image = networkImage.isEmpty ? TImages.user : networkImage;

      return ListTile(
        leading: ClipOval(
          child: Image(
            image: networkImage.isEmpty
                ? const AssetImage(TImages.user)
                : NetworkImage(networkImage) as ImageProvider,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: TColors.white),
        ),
      );
    });
  }
}

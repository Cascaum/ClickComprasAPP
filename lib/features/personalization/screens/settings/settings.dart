import 'package:clickcompras/common/widgets/appbar/appbar.dart';
import 'package:clickcompras/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:clickcompras/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:clickcompras/common/widgets/texts/section_heading.dart';
import 'package:clickcompras/features/personalization/screens/profile/profile.dart';
import 'package:clickcompras/features/shop/screens/order/order.dart';
import 'package:clickcompras/utils/constants/colors.dart';
import 'package:clickcompras/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../authentication/screens/login/login.dart';
import '../address/adress.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(child: Column(
              children: [
                TAppBar(title: Text('Perfil de usuário', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
                TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(title: 'Configurações da conta', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(icon: Iconsax.safe_home, title: 'Meu endereço', subTitle: 'Endereço de entrega das compras', onTap: () => Get.to(() => const UserAddressScreen())),
                  TSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'Meu carrinho', subTitle: 'Adicionar, remover produtos e ir para o checkout', onTap: (){}),
                  TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'Minhas ordens de compra', subTitle: 'Ordens de compra realizadas', onTap: () => Get.to(() => const OrderScreen())),
                  TSettingsMenuTile(icon: Iconsax.bank, title: 'Conta bancária', subTitle: 'Retirar saldo para conta bancária cadastrada', onTap: (){}),
                  TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'Meus cupons', subTitle: 'Lista de cupons com desconto', onTap: (){}),
                  TSettingsMenuTile(icon: Iconsax.notification, title: 'Notificações', subTitle: 'Definir qualquer tipo de mensagem de notificação', onTap: (){}),
                  TSettingsMenuTile(icon: Iconsax.security_card, title: 'Privacidade da conta', subTitle: 'Gerenciar uso de dados e contas conectadas', onTap: (){}),

                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(title: 'Configuração do aplicativo', showActionButton: false),
                  const TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Carregar dados', subTitle: 'Enviar dados do seu Cloud Firebase', ),

                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocalização',
                    subTitle: 'Definir recomendações baseado na sua localização',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Modo seguro',
                    subTitle: 'Procure resultados disponíveis para todas as idades',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'Qualidade da imagem HD',
                    subTitle: 'Definir qualidade da imagem apresentada',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Botão de logout atualizado
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        await AuthenticationRepository.instance.logout();
                        Get.offAll(() => const LoginScreen()); // Redireciona para a tela de login
                      },
                      child: const Text('Desconectar'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

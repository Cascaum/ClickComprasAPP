import 'package:clickcompras/navigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/address_controller.dart';
import '../../models/order_model.dart';
import 'cart_controller.dart';
import 'checkout_controller.dart';
import 'order_repository.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Ocorreu um erro.', message: e.toString());
      return [];
    }
  }
  void processOrder(double totalAmount) async {
    try {
      // Start loader
      TFullScreenLoader.openLoadingDialog('Processando seu pedido...', TImages.pencilAnimation);

      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) return;

      // Add order details
      final order = OrderModel(
        id: UniqueKey().toString(), // Generate a unique ID for the order
        userId: userId,
        status: OrderStatus.processando,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(() => SuccessScreen(
        image: TImages.orderCompletedAnimation,
        title: 'Pagamento efetuado com sucesso!',
        subTitle: 'Seu item será enviado em breve!',
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      )); // SuccessScreen
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Ocorreu um erro.', message: e.toString());
    }
    }
  }


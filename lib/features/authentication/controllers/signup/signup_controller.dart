import 'package:clickcompras/data/repositories/authentication/authentication_repository.dart';
import 'package:clickcompras/data/repositories/user/user_repository.dart';
import 'package:clickcompras/features/authentication/screens/signup/verify_email.dart';
import 'package:clickcompras/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/netword_manager/network_manager.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      TFullScreenLoader.openLoadingDialog('Coletando dados de cadastro...', TImages.doceranimation);


      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading(); // Adicione esta linha
        TLoaders.warningSnackBar(
          title: 'Aceite as políticas de privacidade e termos de uso',
          message: 'Para prosseguir com a criação da conta, aceite as políticas de privacidade e termos de uso.',
        );
        return;
      }

      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Parabéns!', message: 'Sua conta foi criada com sucesso. Verifique seu email para continuar.');
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {

      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Ocorreu um erro!', message: e.toString());
    }
  }
}

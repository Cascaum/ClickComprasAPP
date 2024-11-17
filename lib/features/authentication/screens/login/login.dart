import 'package:clickcompras/common/widgets/login_signup/social_buttons.dart';
import 'package:clickcompras/features/authentication/screens/login/widgets/login_form.dart';
import 'package:clickcompras/features/authentication/screens/login/widgets/login_header.dart';
import 'package:clickcompras/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
                children: [
                  const TLoginHeader(),

                  const TLoginForm(),

                  TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

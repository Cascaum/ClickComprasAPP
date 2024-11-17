import 'package:clickcompras/bindings/general_bindings.dart';
import 'package:clickcompras/features/authentication/screens/onboarding/onboarding.dart';
import 'package:clickcompras/routes/app_routes.dart';
import 'package:clickcompras/utils/constants/colors.dart';
import 'package:clickcompras/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: TColors.white))),
    );
  }
}
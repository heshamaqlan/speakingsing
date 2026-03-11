import 'package:flutter/material.dart';
import 'package:speaking_sign/config/constants/constants.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/theme_controller/theme_controller.dart';
import 'package:speaking_sign/routes/app_pages.dart';
import 'package:speaking_sign/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ThemeController());
  runApp(const SpeakingSignApp());
}

class SpeakingSignApp extends StatelessWidget {
  const SpeakingSignApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.light,
        darkTheme: themeController.dark,
        themeMode: themeController.themeMode.value,
        initialRoute: AppRoutes.SPLASH,
        getPages: AppPages.routes,
      ),
    );
  }
}

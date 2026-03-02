import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart' show Hive, HiveX;
import 'package:speaking_sign/config/constants/constants.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/theme_controller/theme_controller.dart';
import 'package:speaking_sign/data/models/animation_model.dart';
import 'package:speaking_sign/presentation/screens/settings/dashboard/add_animation_view.dart';
import 'package:speaking_sign/presentation/screens/word_detaile/word_detaile_view.dart';
import 'package:speaking_sign/presentation/widgets/custom_curved_bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AnimationModelAdapter());

  await Hive.openBox<AnimationModel>(kAnimationBox);
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
        theme: themeController.light,
        darkTheme: themeController.dark,
        themeMode: themeController.themeMode.value,
        debugShowCheckedModeBanner: false,
        routes: {
          WordDetaileView.routeName: (context) => const WordDetaileView(),
          AddAnimationView.routeName: (context) => const AddAnimationView(),
        },
        home: CustomCurvedBottomNavigationBar(),
      ),
    );
  }
}

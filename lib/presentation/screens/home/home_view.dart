// no controller
import 'package:flutter/material.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      extendBody: true,
      backgroundColor: colors.scaffoldBackground,
    );
  }
}

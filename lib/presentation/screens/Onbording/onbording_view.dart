import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/presentation/widgets/onboarding/custombutton.dart';
import 'package:speaking_sign/presentation/widgets/onboarding/customcontrolls.dart';
import 'package:speaking_sign/presentation/widgets/onboarding/customslider.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 70),

            Expanded(
              flex: 2,
              child: Customslider(pageController: _pageController),
            ),

            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Customcontrolls(),
                  const SizedBox(height: 80),
                  Custombutton(pageController: _pageController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

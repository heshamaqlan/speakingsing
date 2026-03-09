import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/controller/onboarding/onbording_controller.dart';
import 'package:speaking_sign/data/static/static.dart';

class Customslider extends StatelessWidget {
  final PageController pageController;

  const Customslider({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final controller = Get.find<OnboardingController>();

    return PageView.builder(
      controller: pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onbordinglist.length,
      itemBuilder:
          (context, i) => Column(
            children: [
              Image.asset(onbordinglist[i].image!),

              const SizedBox(height: 30),

              Text(
                onbordinglist[i].title!,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                child: Text(
                  onbordinglist[i].body!,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontFamily: "Cairo",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
    );
  }
}

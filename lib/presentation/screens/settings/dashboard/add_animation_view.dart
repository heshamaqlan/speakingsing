import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/controller/add_animation/add_animation_controller.dart';
import 'package:speaking_sign/presentation/screens/settings/dashboard/add_animation_form.dart';

class AddAnimationView extends StatelessWidget {
  const AddAnimationView({super.key});

  static String routeName = '/addAnimation';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    // Initialize AddAnimationController for this view
    Get.put(AddAnimationController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: colors.wordCard,
                    child: IconButton(
                      onPressed: () {
                        // Ensure controller memory is freed, though GetX usually handles it when not persistent.
                        Get.delete<AddAnimationController>();
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 28,
                        color: colors.wordCardText,
                      ),
                    ),
                  ),
                  SizedBox(width: 70),
                  Text(
                    'اضافة حركة جديدة',
                    style: TextStyle(
                      color: colors.wordCardText,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            AddAnimationForm(colors: colors),
          ],
        ),
      ),
    );
  }
}

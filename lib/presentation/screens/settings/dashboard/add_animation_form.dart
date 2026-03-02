import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/controller/add_animation/add_animation_controller.dart';
import 'package:speaking_sign/presentation/widgets/custom_button.dart';
import 'package:speaking_sign/presentation/widgets/custom_drop_down_button_field.dart';
import 'package:speaking_sign/presentation/widgets/custom_text_field.dart';
import 'package:speaking_sign/presentation/widgets/custom_upload_file_button.dart';

class AddAnimationForm extends StatelessWidget {
  AddAnimationForm({super.key, required this.colors});

  final AppColors colors;
  final AddAnimationController controller = Get.find<AddAnimationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.formkey,
        autovalidateMode: controller.autovalidateMode.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextField(
              colors: colors,
              lableText: 'الكلمة عربي',
              hintText: 'إدخل كلمة بالعربي',
              onSaved: (value) {
                controller.arName = value;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'يرجى تحديد الإسم الذي ستظهر الحركة به';
                } else {
                  return null;
                }
              },
            ),
            CustomTextField(
              colors: colors,
              lableText: 'الكلمة إنجليزي',
              hintText: 'إدخل الكلمة كما هي في الملف',
              onSaved: (value) {
                controller.enName = value;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'يرجى إدخال اسم الحركة في الملف';
                } else {
                  return null;
                }
              },
            ),
            CustomDropDownButtonField(
              hintText: 'الفئة',
              label: 'الفئة',
              colors: colors,
              onChanged: (value) {
                controller.category = value!;
              },
              category: controller.category,
            ),

            CustomUplodFileButton(colors: colors),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(16),
              child:
                  controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : CustomButton(
                        text: 'إضافة الحركة',
                        onTap: () {
                          controller.addNewMove();
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

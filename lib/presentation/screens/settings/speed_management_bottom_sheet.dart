import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/controller/settings/settings_controller.dart';
import 'package:speaking_sign/presentation/widgets/custom_button.dart';

class SpeedManagementBottomSheet extends StatelessWidget {
  SpeedManagementBottomSheet({super.key});

  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 45,
            height: 5,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Text(
            'إدارة حركة الشخصية ',
            style: TextStyle(color: colors.wordCardText, fontSize: 18),
          ),
          SizedBox(height: 44),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'سرعة الحركة للشخصية ',
                style: TextStyle(color: colors.wordCardText, fontSize: 16),
              ),

              Slider(
                value: controller.speedValue.value,
                onChanged: (newValue) {
                  controller.updateSpeed(newValue);
                },
                min: 0.0,
                max: 1.0,
                divisions: 10,
                label: controller.speedValue.value.toString(),
              ),

              SizedBox(height: 12),
              Divider(indent: 10, endIndent: 10),
              SizedBox(height: 12),

              Text(
                'التحكم بالكاميرا',
                style: TextStyle(color: colors.wordCardText, fontSize: 16),
              ),

              Row(
                children: [
                  Checkbox(
                    value: controller.isCheckedCamera.value,
                    onChanged: (bool? isChecked) {
                      controller.toggleCamera(isChecked ?? false);
                    },
                  ),
                  Text(
                    controller.isCheckedCamera.value ? 'مفعَل' : 'غير مفعَل',
                    style: TextStyle(
                      color:
                          controller.isCheckedCamera.value
                              ? colors.wordCardText
                              : Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Divider(indent: 10, endIndent: 10),
              SizedBox(height: 12),

              Text(
                'التشغيل التلقائي للحركة ',
                style: TextStyle(color: colors.wordCardText, fontSize: 16),
              ),

              Row(
                children: [
                  Checkbox(
                    value: controller.isCheckedPlay.value,
                    onChanged: (bool? isChecked) {
                      controller.togglePlay(isChecked ?? false);
                    },
                  ),
                  Text(
                    controller.isCheckedPlay.value ? 'مفعَل' : 'غير مفعَل',
                    style: TextStyle(
                      color:
                          controller.isCheckedPlay.value
                              ? colors.wordCardText
                              : Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Divider(indent: 10, endIndent: 10),
              SizedBox(height: 12),

              Text(
                'الدوران التلقائي للحركة ',
                style: TextStyle(color: colors.wordCardText, fontSize: 16),
              ),

              Row(
                children: [
                  Checkbox(
                    value: controller.isCheckedRotate.value,
                    onChanged: (bool? isChecked) {
                      controller.toggleRotate(isChecked ?? false);
                    },
                  ),
                  Text(
                    controller.isCheckedRotate.value ? 'مفعَل' : 'غير مفعَل',
                    style: TextStyle(
                      color:
                          controller.isCheckedRotate.value
                              ? colors.wordCardText
                              : Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          CustomButton(
            text: 'حفظ الإعدادات',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

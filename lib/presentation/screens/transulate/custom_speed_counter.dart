import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/controller/transulate/translate_controller.dart';

class CustomSpeedCounter extends StatelessWidget {
  CustomSpeedCounter({super.key, required this.colors});

  final AppColors colors;
  final TranslateController controller = Get.find<TranslateController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 135,
      width: 55,
      decoration: BoxDecoration(
        color: colors.navigaionBar,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            alignment: Alignment.center,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            onPressed: () {
              controller.increaseSpeed();
            },
            icon: Icon(
              Icons.arrow_drop_up_rounded,
              color: colors.wordCardIcon,
              size: 44,
            ),
          ),
          SizedBox(height: 6),
          Obx(
            () => Text(
              ((controller.speedValue.value * 10).round() / 10).toString(),
              maxLines: 1,
              style: TextStyle(
                color: colors.wordCardText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 6),
          IconButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            alignment: Alignment.center,
            onPressed: () {
              controller.decreaseSpeed();
            },
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: colors.wordCardIcon,
              size: 44,
            ),
          ),
        ],
      ),
    );
  }
}

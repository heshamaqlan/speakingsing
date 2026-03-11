import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:speaking_sign/controller/settings/camera/camera_controller.dart';
import 'package:speaking_sign/controller/settings/conction_theglavs/conctionthglovs_controller.dart';
import 'package:speaking_sign/presentation/widgets/public/custom_top_header2.dart';

class Camera extends StatelessWidget {
  Camera({super.key});
  final CameraController controller = Get.put(CameraController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTopHeader2(
              text: "كاميـــرا التدريب",
              icon: IconButton(
                onPressed: () {
                  controller.navigateToSetting();
                  // print("هشام هشام هشام");
                },
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ),

            Text("هيثم القفاز "),
            Text("هيثم القفاز "),
            Text("هيثم القفاز "),
            Text("هيثم القفاز "),
            Text("هيثم القفاز "),
            Text("هيثم القفاز "),
          ],
        ),
      ),
    );
  }
}

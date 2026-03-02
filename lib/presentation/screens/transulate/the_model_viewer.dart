import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/controller/transulate/translate_controller.dart';
import 'package:speaking_sign/presentation/screens/transulate/custom_speed_counter.dart';

class TheModelViewer extends StatelessWidget {
  TheModelViewer({super.key, this.borderColor, required this.hasFavBtn});

  final Color? borderColor;
  final bool hasFavBtn;

  final TranslateController controller = Get.find<TranslateController>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? colors.wordCardText!),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Obx(
              () => ModelViewer(
                src: 'assets/glb/charcter_human9.glb',
                alt: 'Custom Model',
                id: 'model-viewer',
                backgroundColor: Colors.transparent,
                animationName: controller.currentAnimation.value,
                autoRotate: false,
                cameraControls: controller.cameraEnabled.value,
                autoPlay: controller.isPlaying.value,
                shadowIntensity: 1.0,
                shadowSoftness: 0.0,
                exposure: 1.0,
                cameraOrbit: "0deg 90deg auto",
                minCameraOrbit: "auto 90deg auto",
                maxCameraOrbit: "auto 90deg auto",
                animationCrossfadeDuration: 500,
                onWebViewCreated: (webViewController) {
                  controller.setWebViewController(webViewController);
                },
                key: ValueKey(controller.currentAnimation.value),
              ),
            ),
          ),
        ),

        Positioned(
          top: 40,
          left: 40,
          child:
              hasFavBtn
                  ? IconButton(
                    alignment: Alignment.center,
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: colors.wordCardIcon,
                      size: 32,
                    ),
                  )
                  : Container(),
        ),

        Positioned(
          bottom: 40,
          right: 40,
          child: CustomSpeedCounter(colors: colors),
        ),

        Positioned(
          bottom: 40,
          left: 40,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: colors.navigaionBar,
                radius: 25,
                child: Obx(
                  () => IconButton(
                    alignment: Alignment.center,
                    onPressed: controller.togglePlay,
                    icon: Icon(
                      controller.isPlaying.value
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: colors.wordCardIcon,
                      size: 32,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              CircleAvatar(
                backgroundColor: colors.navigaionBar,
                radius: 25,
                child: Obx(
                  () => IconButton(
                    alignment: Alignment.center,
                    onPressed: controller.toggleCamera,
                    icon: Icon(
                      controller.cameraEnabled.value
                          ? Icons.videocam_rounded
                          : Icons.videocam_off_rounded,
                      color: colors.wordCardIcon,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

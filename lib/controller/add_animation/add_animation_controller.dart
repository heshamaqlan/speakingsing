import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/core/services/animation_service.dart';
import 'package:speaking_sign/data/models/animation_model.dart';

class AddAnimationController extends GetxController {
  final formkey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled.obs;

  String? arName;
  String? enName;
  String? category;

  var isLoading = false.obs;

  final AnimationService _movesService = AnimationService();

  Future<void> addNewMove({String? glbFilePath}) async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      isLoading.value = true;

      try {
        if (glbFilePath != null) {
          final success = await _movesService.updateGlbFile(glbFilePath);
          if (!success) {
            Get.snackbar('خطأ', 'فشل في استبدال ملف GLB.');
            isLoading.value = false;
            return;
          }
        }

        var newMove = AnimationModel(
          nameAr: arName!,
          animationCode: enName!,
          category: category!,
        );

        await _movesService.addMove(newMove);
        Get.snackbar('نجاح', 'تم اضافة الحركة بنجاح');

        // You could pop the route here if desired: Get.back()
      } catch (e) {
        Get.snackbar('خطأ', 'فشل في إضافة الحركة: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      autovalidateMode.value = AutovalidateMode.always;
    }
  }
}

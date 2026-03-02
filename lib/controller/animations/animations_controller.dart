import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:speaking_sign/config/constants/constants.dart';
import 'package:speaking_sign/core/services/animation_service.dart';
import 'package:speaking_sign/data/models/animation_model.dart';

class AnimationsController extends GetxController {
  final AnimationService _animationService = AnimationService();
  var animationsData = <AnimationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadAnimations();
  }

  void _loadAnimations() {
    Box<AnimationModel> animationsBox = Hive.box<AnimationModel>(kAnimationBox);
    animationsData.value = animationsBox.values.toList();
  }

  void addAnimation(AnimationModel animation) {
    _animationService.addMove(animation);
    _loadAnimations();
  }
}

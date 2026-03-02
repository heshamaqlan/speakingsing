import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:speaking_sign/presentation/screens/word_detaile/word_detaile_view.dart';
import 'package:speaking_sign/config/constants/constants.dart';

class FavoriteWordsController extends GetxController {
  // استخدام .obs لجعل المتغيرات قابلة للمراقبة
  var currentItemIndex = 0.obs;

  final List<String> favoriteWords = [
    'الان',
    'انا',
    'السلام عليكم',
    'يأكل',
    'يشرب',
    'رقم واحد',
    'رقم عشرة',
    'أبي',
    'صديقي',
    'معجب',
    'تحية',
    'مبرمج',
    'أخي',
  ];

  void selectWord(int index, String key, BuildContext context) {
    currentItemIndex.value = index;
    
    // التنقل باستخدام GetX أو Navigator العادي كما في كودك
    Get.toNamed(
      WordDetaileView.routeName,
      arguments: key,
    );
  }
}

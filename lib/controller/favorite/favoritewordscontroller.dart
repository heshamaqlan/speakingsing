import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/presentation/screens/word_detaile/word_detaile_view.dart';

class FavoriteWordsController extends GetxController {
  var currentItemIndex = 0.obs;

  RxList<String> favoriteWords = <String>[].obs;

  void addFavoriteWord(String word) {
    if (!favoriteWords.contains(word)) {
      favoriteWords.add(word);
      Get.snackbar(
        "المفضلة",
        "تمت إضافة الكلمة إلى المفضلة",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "المفضلة",
        "الكلمة موجودة بالفعل",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  void selectWord(int index, String key, BuildContext context) {
    currentItemIndex.value = index;

    Get.toNamed(WordDetaileView.routeName, arguments: key);
  }
}

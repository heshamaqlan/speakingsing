import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/controller/favorite/favoritewordscontroller.dart';
import 'package:speaking_sign/presentation/widgets/favorite_word_card.dart';

class FavoriteWordsListView extends GetView<FavoriteWordsController> {
  const FavoriteWordsListView({super.key});

  @override
  Widget build(BuildContext context) {
    // حقن الـ Controller إذا لم يكن محقوناً مسبقاً في الـ Binding
    final controller = Get.put(FavoriteWordsController());

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: controller.favoriteWords.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        // ملاحظة: استبدلت animations.keys بـ favoriteWords لأن animations لم تكن معرفة في الكود المرسل
        // إذا كنت تعتمد على animations، يمكننا نقلها أيضاً للـ controller
        final word = controller.favoriteWords[index];

        return GestureDetector(
          onTap: () => controller.selectWord(index, word, context),
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: FavoriteWordCard(
                isSelected: controller.currentItemIndex.value == index,
                text: word,
                gradientColors: const [
                  Color(0xFFDA22FF),
                  Color(0xFF9733EE),
                  Color(0xFF667EEA),
                ],
                glowIntensity: 0.3,
              ),
            ),
          ),
        );
      },
    );
  }
}

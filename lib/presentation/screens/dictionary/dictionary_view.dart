import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/presentation/screens/dictionary/dictionary_grid_view.dart';
import 'package:speaking_sign/presentation/widgets/categories_list_view.dart';
import 'package:speaking_sign/presentation/widgets/custom_top_header.dart';
import 'package:speaking_sign/controller/dictionary/dictionary_controller.dart';

class DictionaryView extends StatelessWidget {
  const DictionaryView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(DictionaryController());

    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      extendBody: true,
      backgroundColor: colors.scaffoldBackground,
      body: Column(
        children: [
          CustomTopHeader(text: "قاموس الكلمات"),
          SizedBox(height: 8),
          CategoriesListView(),
          SizedBox(height: 8),
          Expanded(child: DictionaryGridView()),
        ],
      ),
    );
  }
}

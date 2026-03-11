import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/controller/settings/Proposals/proposals_controller.dart';
import 'package:speaking_sign/presentation/widgets/custom_button.dart';
import 'package:speaking_sign/presentation/widgets/custom_text_field.dart';
import 'package:speaking_sign/presentation/widgets/public/custom_top_header2.dart';

class ProposalsView extends StatelessWidget {
  ProposalsView({super.key});

  final ProposalsController controller = Get.put(ProposalsController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomTopHeader2(
                text: "المقترحــــات",
                icon: IconButton(
                  onPressed: () {
                    controller.navigateToSetting();
                    // print("هشام هشام هشام");
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              CustomTextField(
                colors: Colors.white,
                lableText: 'الكلمة عربي',
                hintText: 'إدخل كلمة بالعربي',
                onSaved: (value) {},
                validator: (value) {},
              ),

              CustomTextField(
                colors: Colors.white,
                lableText: 'الفئة',
                hintText: 'إدخل الفئة',
                onSaved: (value) {},
                validator: (value) {},
              ),

              CustomTextField(
                colors: Colors.white,
                lableText: 'شرح الحركة',
                hintText: 'شـــرح الحركة',
                onSaved: (value) {},
                validator: (value) {},
              ),

              const SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  text: 'إضافة الحركة',
                  onTap: () {
                    print("هشام هشام هشام ");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

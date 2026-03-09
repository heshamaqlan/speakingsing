import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/controller/keyboard/keboard_controller.dart';
import 'package:speaking_sign/data/static/static.dart';
import 'package:speaking_sign/presentation/widgets/Keyboard/customkeyboard.dart';
import 'package:speaking_sign/presentation/widgets/public/custom_top_header2.dart';

class Keyboard extends StatelessWidget {
  Keyboard({Key? key}) : super(key: key);

  final KeyboardController controller = Get.find<KeyboardController>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTopHeader2(text: "لوحة المفاتيح الإشارية"),
          SizedBox(height: 120),
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                        () => Container(
                          width: 330,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),

                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            child: Text(
                              controller.displayText.value,
                              style: const TextStyle(
                                fontFamily: "Cairo",
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          ": النــص",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            color: Colors.purple,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                //خطط افقي
                Divider(
                  color: Colors.black.withOpacity(0.2),
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade300, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 100,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.inputSigns.length,
                      itemBuilder: (context, index) {
                        final sign = controller.inputSigns[index];

                        if (sign.char == " ") {
                          return const SizedBox(width: 20);
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Image.asset(sign.assetpath!, height: 80),
                        );
                      },
                    ),
                  ),
                ),

                // الكيبورد
                Container(
                  width: double.infinity,
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ...keboardlist.map((row) {
                          return Expanded(
                            child: Row(
                              children:
                                  row.map((sign) {
                                    return KeyboardButton(
                                      label: sign.char!,
                                      imagePath: sign.assetpath!,
                                      onPressed: () => controller.addSign(sign),
                                    );
                                  }).toList(),
                            ),
                          );
                        }).toList(),

                        Row(
                          children: [
                            // مسح
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(
                                  onPressed: controller.deleteLast,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      181,
                                      115,
                                      115,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'مســح',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // مسافة
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(
                                  onPressed: controller.addSpace,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'مسافـــة',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // اذهب
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(
                                  onPressed: controller.submitText,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      203,
                                      168,
                                      254,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'اذهـــب',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

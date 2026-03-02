// no controller
import 'package:flutter/material.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';
import 'package:speaking_sign/presentation/screens/settings/settings_items_list_view.dart';
import 'package:speaking_sign/presentation/screens/settings/settings_page_header.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      backgroundColor: Color(0xffc77dff),
      body: Column(
        children: [
          SettingsPageHeader(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 32, bottom: 32),
              decoration: BoxDecoration(
                color: colors.scaffoldBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Text(
                      'الإعــدادات',
                      style: TextStyle(
                        fontSize: 20,
                        color: colors.wordCardText,
                      ),
                    ),
                    SizedBox(height: 12),
                    Expanded(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SettingsItemsListView(),

                          Positioned(
                            top: -230,
                            left: 105,
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.cover,
                              width: 240,
                              height: 240,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

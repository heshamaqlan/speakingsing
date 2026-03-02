import 'package:flutter/material.dart';
import 'package:speaking_sign/config/constants/constants.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';

class WordCard extends StatelessWidget {
  const WordCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      decoration: BoxDecoration(
        color: colors.wordCard,
        borderRadius: BorderRadius.circular(24),
        // border: Border.all(color: Color(0xff8B3DFF), width: 0),
        boxShadow: [
          BoxShadow(
            color: colors.cardShadow,
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(4, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    kBaseImage,
                    width: 160,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 12,),
                  Text(text, style: TextStyle(color: colors.wordCardText)),
                ],
              ),

              Positioned(
                top: 2,
                left: 2,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: colors.wordCardIcon,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

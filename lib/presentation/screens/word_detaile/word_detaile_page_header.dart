// no controller
import 'package:flutter/material.dart';

class WordDetailePageHeader extends StatelessWidget {
  const WordDetailePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: Color(0xff8B3DFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white30,
                ),
              ),
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 100,
            left: 40,
            child: Icon(Icons.back_hand, size: 28, color: Colors.white30),
          ),
          Positioned(
            top: 165,
            left: 30,
            child: Icon(Icons.spa_outlined, size: 28, color: Colors.white30),
          ),
          Positioned(
            top: 80,
            left: 200,
            child: Icon(
              Icons.spatial_audio_off_rounded,
              size: 28,
              color: Colors.white30,
            ),
          ),

          Positioned(
            top: 60,
            right: 110,
            child: Icon(
              Icons.hearing_outlined,
              size: 30,
              color: Colors.white30,
            ),
          ),
          Positioned(
            top: 35,
            right: 40,
            child: Icon(Icons.back_hand, size: 28, color: Colors.white30),
          ),
          Positioned(
            bottom: 140,
            left: 140,
            child: Icon(Icons.back_hand, size: 28, color: Colors.white30),
          ),
          Positioned(
            top: 45,
            left: 130,
            child: Icon(Icons.spa_outlined, size: 28, color: Colors.white30),
          ),
          Positioned(
            bottom: 80,
            left: 65,
            child: Icon(
              Icons.spatial_audio_off_rounded,
              size: 28,
              color: Colors.white30,
            ),
          ),
          Positioned(
            bottom: 80,
            right: 65,
            child: Icon(
              Icons.spatial_audio_off_rounded,
              size: 28,
              color: Colors.white30,
            ),
          ),
          Positioned(
            top: 140,
            right: 170,
            child: Icon(Icons.star, size: 24, color: Colors.white30),
          ),
          Positioned(
            top: 180,
            right: 40,
            child: Icon(Icons.star, size: 24, color: Colors.white30),
          ),
          Positioned(
            top: 120,
            left: 120,
            child: Icon(
              Icons.hearing_outlined,
              size: 30,
              color: Colors.white30,
            ),
          ),
          Positioned(
            bottom: 140,
            right: 110,
            child: Icon(
              Icons.hearing_outlined,
              size: 30,
              color: Colors.white30,
            ),
          ),
          Positioned(
            top: 130,
            right: 70,
            child: Icon(Icons.spa_outlined, size: 28, color: Colors.white30),
          ),
        ],
      ),
    );
  }
}

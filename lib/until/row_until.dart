import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';

class RowUntil {
  Padding premiumRowMethod(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/icons/icon_premium.png",
            width: 12,
            height: 12,
          ),
          SizedBox(width: 5),
          TextUntil.buildTextWidget(
              text, 17, Colors.white, TextConstants.poppins, FontWeight.w400)
        ],
      ),
    );
  }
}

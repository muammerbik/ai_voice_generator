// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ai_voice_generator/companents/custom_text/custom_text_widget.dart';

class PremiumTextWidget extends StatelessWidget {
  final String text;
  const PremiumTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/icon_premium.png",
            width: 12.h,
            height: 12.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 5.w),
          TextWidgets(text: text, size: 13.sp)
        ],
      ),
    );
  }
}
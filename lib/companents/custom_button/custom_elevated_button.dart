import 'package:ai_voice_generator/companents/custom_text/custom_text_widget.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatefulWidget {
  final String text;
  final Function()? onTop;
  const CustomElevatedButton({
    Key? key,
    required this.text,
    this.onTop,
  }) : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GestureDetector(
        onTap: widget.onTop,
        child: Container(
          width: double.infinity,
          height: 72.h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                ColorConstants.buttonPurpleColor,
                ColorConstants.buttonBlueColor,
              ],
            ),
            borderRadius: BorderRadius.circular(25.r),
            boxShadow: const [
              BoxShadow(
                color: ColorConstants.shadowColor,
                blurRadius: 10,
                offset: Offset(0, 5),
                spreadRadius: 4,
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: TextWidgets(text: widget.text, size: 20.sp),
          ),
        ),
      ),
    );
  }
}

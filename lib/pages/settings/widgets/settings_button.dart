// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_voice_generator/components/custom_text/custom_text_widget.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSettingsButton extends StatefulWidget {
  final Color? buttonColor;

  final Color? textColor;
  final VoidCallback onTap;
  final double? height;
  final String title;
  final double? fontSize;
  final Color? iconColor;
  const CustomSettingsButton({
    Key? key,
    this.buttonColor,
    this.textColor,
    required this.onTap,
    this.height,
    required this.title,
    this.fontSize,
    this.iconColor,
  }) : super(key: key);

  @override
  State<CustomSettingsButton> createState() => _CustomSettingsButtonState();
}

class _CustomSettingsButtonState extends State<CustomSettingsButton> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: Container(
            height: widget.height ?? 64.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.r),
              gradient: const LinearGradient(
                colors: [
                  ColorConstants.buttonBlueColor,
                  ColorConstants.buttonPurpleColor,
                ],
              ),
            ),
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: TextWidgets(
                  text: widget.title,
                  size: widget.fontSize ?? 16.sp,
                  color: widget.textColor ?? ColorConstants.white,
                  textAlign: TextAlign.start,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: widget.iconColor ?? ColorConstants.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

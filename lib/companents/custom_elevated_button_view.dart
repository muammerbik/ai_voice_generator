import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomElevatedButtonView extends StatefulWidget {
  final String text;
  final Function() onTop;
  CustomElevatedButtonView(
      {super.key, required this.text, required this.onTop});

  @override
  State<CustomElevatedButtonView> createState() =>
      _CustomElevatedButtonViewState();
}

class _CustomElevatedButtonViewState extends State<CustomElevatedButtonView> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: widget.onTop,
            child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  colors: [
                    ColorConstants.buttonPurpleColor,
                    ColorConstants.buttonBlueColor
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(150),
                ),
                shadows: [
                  const BoxShadow(
                    color: ColorConstants.shadowColor,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextUntil.buildTextWidget(
                    widget.text,
                    17,
                    ColorConstants.white,
                    TextConstants.sfProText,
                    FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

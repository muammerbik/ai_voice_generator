import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:ai_voice_generator/constants/text_constants.dart';
import 'package:ai_voice_generator/until/text_until.dart';
import 'package:flutter/material.dart';

class CustomAppbarView extends StatefulWidget implements PreferredSizeWidget {
  final Function() onPressed;
  final String appBarTitle;
  final String appbarImage;
  CustomAppbarView(
      {super.key,
      required this.onPressed,
      required this.appBarTitle,
      required this.appbarImage});

  @override
  State<CustomAppbarView> createState() => _CustomAppbarViewState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarViewState extends State<CustomAppbarView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: widget.onPressed,
          icon: Image.asset(
            widget.appbarImage,
            height: 25,
            width: 25,
          )),
      title: Padding(
        padding: const EdgeInsets.only(right: 60),
        child: Center(
          child: TextUntil.buildTextWidget(widget.appBarTitle, 22,
              ColorConstants.white, TextConstants.poppins, FontWeight.w700),
        ),
      ),
    );
  }
}

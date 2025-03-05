// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_voice_generator/companents/custom_text/custom_text_widget.dart';
import 'package:ai_voice_generator/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBarView extends StatefulWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  final bool? centerTitle;
  final List<IconButton>? actionIcons;
  final Color? appBarColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final Color? iconColor;
  final IconButton? leadingIcon;

  const CustomAppBarView({
    Key? key,
    this.appBarTitle,
    this.centerTitle,
    this.actionIcons,
    this.appBarColor,
    this.textColor,
    this.onTap,
    this.iconColor,
    this.leadingIcon, 
  }) : super(key: key);

  @override
  State<CustomAppBarView> createState() => _CustomAppBarViewState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarViewState extends State<CustomAppBarView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        surfaceTintColor: ColorConstants.black,
        centerTitle: widget.centerTitle,
        backgroundColor: widget.appBarColor ?? ColorConstants.black,
        leading: widget.leadingIcon ??
            (Navigator.of(context).canPop() ? const SizedBox.shrink() : null),
        title: TextWidgets(
          text: widget.appBarTitle!,
          size: 24,
          color: widget.textColor ?? ColorConstants.white,
        ),
        actions: widget.actionIcons ?? []);
  }
}

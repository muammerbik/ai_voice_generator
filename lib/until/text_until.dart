
import 'package:flutter/material.dart';
class TextUntil {
  static Text buildTextWidget(String text, double fntsize, Color color,String fontfamily,
      [FontWeight? fontWeight]) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fntsize,
        fontFamily:fontfamily,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}

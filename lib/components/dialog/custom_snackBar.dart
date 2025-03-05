import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    Color containerColor = Colors.black,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 2),
  }) {
    final snackBar = SnackBar(
      backgroundColor: containerColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: textColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      duration: duration,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

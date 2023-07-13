import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSnackBar extends SnackBar {
  final String text;
  final bool success;

  static void showSnackBar (BuildContext context, String text, bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(text: text, success: success)
    );

    Navigator.pop(context);
  }

  CustomSnackBar({
    super.key,
    required this.text,
    required this.success
  }) : super(
    duration: const Duration(seconds: 2),
    padding: EdgeInsets.symmetric(vertical: Adaptive.w(4), horizontal: Adaptive.w(3)),
    backgroundColor: success ? CupertinoColors.systemGreen : CupertinoColors.destructiveRed,
    content: Text(text, style: TextStyle(color: Colors.white, fontSize: Adaptive.px(16)),)
  );
}
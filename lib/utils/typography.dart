import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

abstract final class CustomTypography {
  static Map<int, TextStyle> title = {
    0: TextStyle(
        fontSize: Adaptive.px(34),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text[10],
        decoration: TextDecoration.none
    ),
    1: TextStyle(
        fontSize: Adaptive.px(28),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text[10],
        decoration: TextDecoration.none
    ),
    2: TextStyle(
        fontSize: Adaptive.px(22),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text[10],
        decoration: TextDecoration.none
    ),
    3: TextStyle(
        fontSize: Adaptive.px(18),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text[10],
        decoration: TextDecoration.none
    )
  };

  static Map<String, TextStyle> body = {
    '1-regular': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: CustomColors.text[20],
        decoration: TextDecoration.none
    ),
    '1-medium': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        color: CustomColors.text[20],
        decoration: TextDecoration.none
    ),
    '1-semibold': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text[20],
        decoration: TextDecoration.none
    ),
    '1-bold': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text[20],
        decoration: TextDecoration.none
    ),
    '2-regular': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: CustomColors.text[20],
        decoration: TextDecoration.none
    ),
    '2-semibold': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text[20],
        decoration: TextDecoration.none
    ),
    '2-bold': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text[20],
        decoration: TextDecoration.none
    ),
    '2-italic': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w300,
        color: CustomColors.text[20],
        decoration: TextDecoration.none,
        fontStyle: FontStyle.italic
    )
  };

  static Map<String, TextStyle> caption = {
    'regular': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: CustomColors.text[20],
        decoration: TextDecoration.none
    ),
    'semibold': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text[20],
        decoration: TextDecoration.none
    )
  };

  static Map<String, TextStyle> overtitle = {
    'semibold': TextStyle(
      fontSize: Adaptive.px(10),
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      color: CustomColors.text[20],
      decoration: TextDecoration.none
    )
  };

  static Map<String, TextStyle> button = {
    'semibold': TextStyle(
      fontSize: Adaptive.px(14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      color: CustomColors.text[20],
      decoration: TextDecoration.none
    )
  };

  static Map<int, TextStyle> link = {
    1: TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text[20],
        decoration: TextDecoration.underline
    ),
    2: TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text[20],
        decoration: TextDecoration.underline
    )
  };

  static String capitalize(String text){
    if (text.isEmpty){
      return '-';
    }

    return '${text[0].toUpperCase()}${text.substring(1)}';
  }

  static String arrayCapitalize(String text){
    if (text.isEmpty){
      return '-';
    }

    List<String> list = text.split(',');
    String toReturn = '';
    for (String element in list) {
      toReturn += '${capitalize(element.trim())}, ';
    }

    return toReturn.substring(0, toReturn.length - 2);
  }
}
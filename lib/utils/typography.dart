import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomTitleKeys { k0, k1, k2, k3 }
enum CustomBodyKeys { k1Regular, k1Medium, k1Semibold, k1Bold, k2Regular, k2Semibold, k2Bold, k2Italic }
enum CustomCaptionKeys { kRegular, kSemibold }
enum CustomOvertitleKeys { kSemibold }
enum CustomButtonKeys { kSemibold }
enum CustomLinkKeys { k1, k2 }

abstract final class CustomTypography {
  static final Map<int, TextStyle> _title = {
    0: TextStyle(
        fontSize: Adaptive.px(34),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    1: TextStyle(
        fontSize: Adaptive.px(28),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    2: TextStyle(
        fontSize: Adaptive.px(22),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    3: TextStyle(
        fontSize: Adaptive.px(18),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    )
  };

  static final Map<String, TextStyle> _body = {
    '1-regular': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    '1-medium': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    '1-semibold': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    '1-bold': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    '2-regular': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    '2-semibold': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    '2-bold': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    '2-italic': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w300,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none,
        fontStyle: FontStyle.italic
    )
  };

  static final Map<String, TextStyle> _caption = {
    'regular': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    ),
    'semibold': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.none
    )
  };

  static final Map<String, TextStyle> _overtitle = {
    'semibold': TextStyle(
      fontSize: Adaptive.px(10),
      fontFamily: 'Mulish',
      fontWeight: FontWeight.w600,
      color: CustomColors.text(CustomTextKeys.k20),
      decoration: TextDecoration.none
    )
  };

  static final Map<String, TextStyle> _button = {
    'semibold': TextStyle(
      fontSize: Adaptive.px(14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      color: CustomColors.text(CustomTextKeys.k20),
      decoration: TextDecoration.none
    )
  };

  static final Map<int, TextStyle> _link = {
    1: TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.underline
    ),
    2: TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: CustomColors.text(CustomTextKeys.k20),
        decoration: TextDecoration.underline
    )
  };

  static TextStyle title(CustomTitleKeys key) {
    switch (key) {
      case CustomTitleKeys.k0:
        return _title[0]!;
      case CustomTitleKeys.k1:
        return _title[1]!;
      case CustomTitleKeys.k2:
        return _title[2]!;
      case CustomTitleKeys.k3:
        return _title[3]!;
    }
  }

  static TextStyle body(CustomBodyKeys key) {
    switch (key) {
      case CustomBodyKeys.k1Regular:
        return _body['1-regular']!;
      case CustomBodyKeys.k1Medium:
        return _body['1-medium']!;
      case CustomBodyKeys.k1Semibold:
        return _body['1-semibold']!;
      case CustomBodyKeys.k1Bold:
        return _body['1-bold']!;
      case CustomBodyKeys.k2Regular:
        return _body['2-regular']!;
      case CustomBodyKeys.k2Semibold:
        return _body['2-semibold']!;
      case CustomBodyKeys.k2Bold:
        return _body['2-bold']!;
      case CustomBodyKeys.k2Italic:
        return _body['2-italic']!;
    }
  }

  static TextStyle caption(CustomCaptionKeys key) {
    switch (key) {
      case CustomCaptionKeys.kRegular:
        return _caption['regular']!;
      case CustomCaptionKeys.kSemibold:
        return _caption['semibold']!;
    }
  }

  static TextStyle overtitle(CustomOvertitleKeys key) {
    return _overtitle['semibold']!;
  }

  static TextStyle button(CustomButtonKeys key) {
    return _button['semibold']!;
  }

  static TextStyle link(CustomLinkKeys key) {
    switch (key) {
      case CustomLinkKeys.k1:
        return _link[1]!;
      case CustomLinkKeys.k2:
        return _link[2]!;
    }
  }

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
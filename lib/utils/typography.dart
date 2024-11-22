import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum CustomHeadlineKeys { k1, k2, k3 }
enum CustomTitleKeys { k1, k2, k3 }
enum CustomBodyKeys { k1Regular, k1Strong, k2Regular, k2Strong, k3Regular, k3Strong }
enum CustomLinkKeys { k1 }
enum CustomLabelKeys { k1, k2, k3 }

abstract final class CustomTypography {
  static final Map<int, TextStyle> _headline = {
    1: TextStyle(
        fontSize: Adaptive.px(32),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none
    ),
    2: TextStyle(
        fontSize: Adaptive.px(28),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none
    ),
    3: TextStyle(
        fontSize: Adaptive.px(24),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none
    )
  };

  static final Map<int, TextStyle> _title = {
    1: TextStyle(
        fontSize: Adaptive.px(20),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none
    ),
    2: TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none
    ),
    3: TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none
    )
  };

  static final Map<String, TextStyle> _body = {
    '1-regular': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none
    ),
    '1-strong': TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none
    ),
    '2-regular': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none
    ),
    '2-strong': TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none
    ),
    '3-regular': TextStyle(
        fontSize: Adaptive.px(12),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none
    ),
    '3-strong': TextStyle(
        fontSize: Adaptive.px(12),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none
    ),
  };

  static final Map<int, TextStyle> _link = {
    1: TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline
    )
  };

  static final Map<int, TextStyle> _label = {
    1: TextStyle(
        fontSize: Adaptive.px(16),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none
    ),
    2: TextStyle(
        fontSize: Adaptive.px(14),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none
    ),
    3: TextStyle(
        fontSize: Adaptive.px(12),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none
    )
  };


  static TextStyle headline(CustomHeadlineKeys key) {
    switch (key) {
      case CustomHeadlineKeys.k1:
        return _headline[1]!;
      case CustomHeadlineKeys.k2:
        return _headline[2]!;
      case CustomHeadlineKeys.k3:
        return _headline[3]!;
    }
  }

  static TextStyle title(CustomTitleKeys key) {
    switch (key) {
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
      case CustomBodyKeys.k1Strong:
        return _body['1-strong']!;
      case CustomBodyKeys.k2Regular:
        return _body['2-regular']!;
      case CustomBodyKeys.k2Strong:
        return _body['2-strong']!;
      case CustomBodyKeys.k3Regular:
        return _body['3-regular']!;
      case CustomBodyKeys.k3Strong:
        return _body['3-strong']!;
    }
  }

  static TextStyle link(CustomLinkKeys key) {
    switch (key) {
      case CustomLinkKeys.k1:
        return _link[1]!;
    }
  }

  static TextStyle label(CustomLabelKeys key) {
    switch (key) {
      case CustomLabelKeys.k1:
        return _label[1]!;
      case CustomLabelKeys.k2:
        return _label[2]!;
      case CustomLabelKeys.k3:
        return _label[3]!;
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
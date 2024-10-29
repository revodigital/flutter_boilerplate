import 'package:flutter/material.dart';

abstract final class CustomColors {
  static Map<int, Color> primary = {
    30: const Color(0xFF2B4F77),
    40: const Color(0xFF39689C),
    60: const Color(0xFF709BCB),
  };

  static Map<int, Color> neutral = {
    70: const Color(0xFFA6B9CF),
    80: const Color(0xFFC7D3E1),
    90: const Color(0xFFDDE5ED),
    95: const Color(0xFFE8EDF3),
    98: const Color(0xFFF7F8FA),
    100: const Color(0xFFFFFFFF)
  };

  static Map<int, Color> text = {
    20: const Color(0xFF233242),
    30: const Color(0xFF2F4358),
    40: const Color(0xFF3B546E),
  };

  static Map<int, Color> error = {
    30: const Color(0xFFBC241D),
    40: const Color(0xFF9E221C),
  };

  static Map<int, Color> warning = {
    30: const Color(0xFF795900),
    40: const Color(0xFFDFA400)
  };

  static Map<int, Color> success = {
    30: const Color(0xFF167613)
  };

  static Map<int, Color> violet = {
    50: const Color(0xFFB268A8)
  };

  static Map<int, Color> blue = {
    50: const Color(0xFF00B0BC),
    70: const Color(0xFF3C538C)
  };

  static Map<int, Color> red = {
    50: const Color(0xFFBC4B49),
  };

  static Map<int, Color> pillar = {
    10: const Color(0xFF9CEF99),
    20: const Color(0xFFFFE9AC),
    30: const Color(0xFFEF9894)
  };

  static Color transparent = const Color(0x00FFFFFF);
}

abstract final class CustomButtonColors {
  static Map<String, Color> primaryBg = {
    'enabled': CustomColors.primary[40]!,
    'focused': CustomColors.primary[30]!,
    'disabled': CustomColors.primary[60]!,
  };

  static Map<String, Color> primaryText = {
    'enabled': CustomColors.neutral[100]!,
    'focused': CustomColors.neutral[100]!,
    'disabled': CustomColors.neutral[100]!,
  };

  static Map<String, Color> secondaryBg = {
    'enabled': CustomColors.neutral[95]!,
    'focused': CustomColors.neutral[95]!,
    'disabled': CustomColors.neutral[95]!,
  };

  static Map<String, Color> secondaryText = {
    'enabled': CustomColors.primary[40]!,
    'focused': CustomColors.primary[30]!,
    'disabled': CustomColors.primary[60]!,
  };

  static Map<String, Color> tertiaryBg = {
    'enabled': CustomColors.transparent,
    'focused': CustomColors.neutral[100]!,
    'disabled': CustomColors.neutral[100]!,
  };

  static Map<String, Color> tertiaryText = {
    'enabled': CustomColors.primary[40]!,
    'focused': CustomColors.primary[30]!,
    'disabled': CustomColors.primary[60]!,
  };

  static Map<String, Color> alertBg = {
    'enabled': CustomColors.transparent,
    'focused': const Color(0xFFF1E2E4),
    'disabled': CustomColors.neutral[100]!,
  };

  static Map<String, Color> alertText = {
    'enabled': CustomColors.error[30]!,
    'focused': CustomColors.error[30]!,
    'disabled': CustomColors.error[30]!,
  };

  static Map<String, Color> whiteBg = {
    'enabled': CustomColors.neutral[100]!,
    'focused': CustomColors.neutral[100]!,
    'disabled': CustomColors.neutral[100]!,
  };

  static Map<String, Color> whiteText = {
    'enabled': CustomColors.primary[40]!,
    'focused': CustomColors.primary[30]!,
    'disabled': CustomColors.primary[60]!,
  };

  static Map<String, Color> iconBg = {
    'enabled': CustomColors.transparent,
    'focused': CustomColors.neutral[95]!,
    'disabled': CustomColors.neutral[100]!,
  };

  static Map<String, Color> iconText = {
    'enabled': CustomColors.text[40]!,
    'focused': CustomColors.text[40]!,
    'disabled': CustomColors.text[40]!,
  };
}

abstract final class CustomChipColors {
  static Map<String, Color> chipBorder = {
    'enabled': CustomColors.neutral[80]!,
    'active': CustomColors.primary[40]!,
  };

  static Map<String, Color> chipBg = {
    'enabled': CustomColors.neutral[100]!,
    'active': CustomColors.neutral[95]!,
  };

  static Map<String, Color> chipText = {
    'enabled': CustomColors.text[40]!,
    'active': CustomColors.primary[40]!,
  };
}

abstract final class CustomUtilityChipColors {
  static Map<String, Color> chipBorder = {
    'enabled': CustomColors.neutral[80]!,
    'active': CustomColors.primary[40]!,
  };

  static Map<String, Color> chipBg = {
    'enabled': CustomColors.neutral[100]!,
    'active': CustomColors.neutral[95]!,
  };

  static Map<String, Color> chipText = {
    'enabled': CustomColors.text[30]!,
    'active': CustomColors.primary[40]!,
  };
}
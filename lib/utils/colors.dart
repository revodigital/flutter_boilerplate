import 'package:flutter/material.dart';

enum CustomPrimaryKeys { k30, k40, k60 }
enum CustomNeutralKeys { k70, k80, k90, k95, k98, k100 }
enum CustomTextKeys { k20, k30, k40 }
enum CustomErrorKeys { k30, k40 }
enum CustomWarningKeys { k30, k40 }
enum CustomSuccessKeys { k30 }
enum CustomVioletKeys { k50 }
enum CustomBlueKeys { k50, k70 }
enum CustomRedKeys { k50 }

abstract final class CustomColors {
  static final Map<int, Color> _primary = {
    30: const Color(0xFF2B4F77),
    40: const Color(0xFF39689C),
    60: const Color(0xFF709BCB),
  };

  static final Map<int, Color> _neutral = {
    70: const Color(0xFFA6B9CF),
    80: const Color(0xFFC7D3E1),
    90: const Color(0xFFDDE5ED),
    95: const Color(0xFFE8EDF3),
    98: const Color(0xFFF7F8FA),
    100: const Color(0xFFFFFFFF)
  };

  static final Map<int, Color> _text = {
    20: const Color(0xFF233242),
    30: const Color(0xFF2F4358),
    40: const Color(0xFF3B546E),
  };

  static final Map<int, Color> _error = {
    30: const Color(0xFFBC241D),
    40: const Color(0xFF9E221C),
  };

  static final Map<int, Color> _warning = {
    30: const Color(0xFF795900),
    40: const Color(0xFFDFA400)
  };

  static final Map<int, Color> _success = {
    30: const Color(0xFF167613)
  };

  static final Map<int, Color> _violet = {
    50: const Color(0xFFB268A8)
  };

  static final Map<int, Color> _blue = {
    50: const Color(0xFF00B0BC),
    70: const Color(0xFF3C538C)
  };

  static final Map<int, Color> _red = {
    50: const Color(0xFFBC4B49),
  };

  static final Color transparent = const Color(0x00FFFFFF);

  static Color primary(CustomPrimaryKeys key) {
    switch (key) {
      case CustomPrimaryKeys.k30:
        return _primary[30]!;
      case CustomPrimaryKeys.k40:
        return _primary[40]!;
      case CustomPrimaryKeys.k60:
        return _primary[60]!;
    }
  }

  static Color neutral(CustomNeutralKeys key) {
    switch (key) {
      case CustomNeutralKeys.k70:
        return _neutral[70]!;
      case CustomNeutralKeys.k80:
        return _neutral[80]!;
      case CustomNeutralKeys.k90:
        return _neutral[90]!;
      case CustomNeutralKeys.k95:
        return _neutral[95]!;
      case CustomNeutralKeys.k98:
        return _neutral[98]!;
      case CustomNeutralKeys.k100:
        return _neutral[100]!;
    }
  }

  static Color text(CustomTextKeys key) {
    switch (key) {
      case CustomTextKeys.k20:
        return _text[20]!;
      case CustomTextKeys.k30:
        return _text[30]!;
      case CustomTextKeys.k40:
        return _text[40]!;
    }
  }

  static Color error(CustomErrorKeys key) {
    switch (key) {
      case CustomErrorKeys.k30:
        return _error[30]!;
      case CustomErrorKeys.k40:
        return _error[40]!;
    }
  }

  static Color warning(CustomWarningKeys key) {
    switch (key) {
      case CustomWarningKeys.k30:
        return _warning[30]!;
      case CustomWarningKeys.k40:
        return _warning[40]!;
    }
  }

  static Color success(CustomSuccessKeys key) {
    switch (key) {
      case CustomSuccessKeys.k30:
        return _success[30]!;
    }
  }

  static Color violet(CustomVioletKeys key) {
    switch (key) {
      case CustomVioletKeys.k50:
        return _violet[50]!;
    }
  }

  static Color blue(CustomBlueKeys key) {
    switch (key) {
      case CustomBlueKeys.k50:
        return _blue[50]!;
      case CustomBlueKeys.k70:
        return _blue[70]!;
    }
  }

  static Color red(CustomRedKeys key) {
    switch (key) {
      case CustomRedKeys.k50:
        return _red[50]!;
    }
  }
}

abstract final class CustomButtonColors {
  static Map<String, Color> primaryBg = {
    'enabled': CustomColors.primary(CustomPrimaryKeys.k40),
    'focused': CustomColors.primary(CustomPrimaryKeys.k30),
    'disabled': CustomColors.primary(CustomPrimaryKeys.k60),
  };

  static Map<String, Color> primaryText = {
    'enabled': CustomColors.neutral(CustomNeutralKeys.k100),
    'focused': CustomColors.neutral(CustomNeutralKeys.k100),
    'disabled': CustomColors.neutral(CustomNeutralKeys.k100),
  };

  static Map<String, Color> secondaryBg = {
    'enabled': CustomColors.neutral(CustomNeutralKeys.k95),
    'focused': CustomColors.neutral(CustomNeutralKeys.k95),
    'disabled': CustomColors.neutral(CustomNeutralKeys.k95),
  };

  static Map<String, Color> secondaryText = {
    'enabled': CustomColors.primary(CustomPrimaryKeys.k40),
    'focused': CustomColors.primary(CustomPrimaryKeys.k30),
    'disabled': CustomColors.primary(CustomPrimaryKeys.k60),
  };

  static Map<String, Color> tertiaryBg = {
    'enabled': CustomColors.transparent,
    'focused': CustomColors.neutral(CustomNeutralKeys.k100),
    'disabled': CustomColors.neutral(CustomNeutralKeys.k100),
  };

  static Map<String, Color> tertiaryText = {
    'enabled': CustomColors.primary(CustomPrimaryKeys.k40),
    'focused': CustomColors.primary(CustomPrimaryKeys.k30),
    'disabled': CustomColors.primary(CustomPrimaryKeys.k60),
  };

  static Map<String, Color> alertBg = {
    'enabled': CustomColors.transparent,
    'focused': const Color(0xFFF1E2E4),
    'disabled': CustomColors.neutral(CustomNeutralKeys.k100),
  };

  static Map<String, Color> alertText = {
    'enabled': CustomColors.error(CustomErrorKeys.k30),
    'focused': CustomColors.error(CustomErrorKeys.k30),
    'disabled': CustomColors.error(CustomErrorKeys.k30),
  };

  static Map<String, Color> whiteBg = {
    'enabled': CustomColors.neutral(CustomNeutralKeys.k100),
    'focused': CustomColors.neutral(CustomNeutralKeys.k100),
    'disabled': CustomColors.neutral(CustomNeutralKeys.k100),
  };

  static Map<String, Color> whiteText = {
    'enabled': CustomColors.primary(CustomPrimaryKeys.k40),
    'focused': CustomColors.primary(CustomPrimaryKeys.k30),
    'disabled': CustomColors.primary(CustomPrimaryKeys.k60),
  };

  static Map<String, Color> iconBg = {
    'enabled': CustomColors.transparent,
    'focused': CustomColors.neutral(CustomNeutralKeys.k95),
    'disabled': CustomColors.neutral(CustomNeutralKeys.k100),
  };

  static Map<String, Color> iconText = {
    'enabled': CustomColors.text(CustomTextKeys.k40),
    'focused': CustomColors.text(CustomTextKeys.k40),
    'disabled': CustomColors.text(CustomTextKeys.k40),
  };
}

abstract final class CustomChipColors {
  static Map<String, Color> chipBorder = {
    'enabled': CustomColors.neutral(CustomNeutralKeys.k80),
    'active': CustomColors.primary(CustomPrimaryKeys.k40),
  };

  static Map<String, Color> chipBg = {
    'enabled': CustomColors.neutral(CustomNeutralKeys.k100),
    'active': CustomColors.neutral(CustomNeutralKeys.k95),
  };

  static Map<String, Color> chipText = {
    'enabled': CustomColors.text(CustomTextKeys.k40),
    'active': CustomColors.primary(CustomPrimaryKeys.k40),
  };
}

abstract final class CustomUtilityChipColors {
  static Map<String, Color> chipBorder = {
    'enabled': CustomColors.neutral(CustomNeutralKeys.k80),
    'active': CustomColors.primary(CustomPrimaryKeys.k40),
  };

  static Map<String, Color> chipBg = {
    'enabled': CustomColors.neutral(CustomNeutralKeys.k100),
    'active': CustomColors.neutral(CustomNeutralKeys.k95),
  };

  static Map<String, Color> chipText = {
    'enabled': CustomColors.text(CustomTextKeys.k30),
    'active': CustomColors.primary(CustomPrimaryKeys.k40),
  };
}
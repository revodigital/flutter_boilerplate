import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/components/floating_action_button.dart';

import '../components/button.dart';
import '../components/icon_button.dart';

///CUSTOM COLORS
class _CustomGreyColors {
  final Color k0 = const Color(0xFFFFFFFF);
  final Color k25 = const Color(0xFFF9F9F9);
  final Color k50 = const Color(0xFFF5EFF7);
  final Color k100 = const Color(0xFFE6E0E9);
  final Color k200 = const Color(0xFFCAC5CD);
  final Color k300 = const Color(0xFFAEA9B1);
  final Color k400 = const Color(0xFF938F96);
  final Color k500 = const Color(0xFF79767D);
  final Color k600 = const Color(0xFF605D64);
  final Color k700 = const Color(0xFF48464C);
  final Color k800 = const Color(0xFF322F35);
  final Color k900 = const Color(0xFF1D1B20);
  final Color k1000 = const Color(0xFF000000);
}

class _CustomPurpleColors {
  final Color k25 = const Color(0xFFF8F9FF);
  final Color k50 = const Color(0xFFF6EDFF);
  final Color k100 = const Color(0xFFEADDFF);
  final Color k200 = const Color(0xFFD0BCFF);
  final Color k300 = const Color(0xFFB69DF8);
  final Color k400 = const Color(0xFFA382DB);
  final Color k500 = const Color(0xFF7F67BE);
  final Color k600 = const Color(0xFF6750A4);
  final Color k700 = const Color(0xFF4F378B);
  final Color k800 = const Color(0xFF381E72);
  final Color k900 = const Color(0xFF21005D);
}

class _CustomQuartzColors {
  final Color k25 = const Color(0xFFF8F9FF);
  final Color k50 = const Color(0xFFF6EDFF);
  final Color k100 = const Color(0xFFE8DEF8);
  final Color k200 = const Color(0xFFCCC2DC);
  final Color k300 = const Color(0xFFB0A7C0);
  final Color k400 = const Color(0xFF958DA5);
  final Color k500 = const Color(0xFF7A7289);
  final Color k600 = const Color(0xFF625B71);
  final Color k700 = const Color(0xFF4A4458);
  final Color k800 = const Color(0xFF332D41);
  final Color k900 = const Color(0xFF1D192B);
}

class _CustomRedColors {
  final Color k25 = const Color(0xFFFFF8F7);
  final Color k50 = const Color(0xFFFCEEEE);
  final Color k100 = const Color(0xFFF9DEDC);
  final Color k200 = const Color(0xFFF2B8B5);
  final Color k300 = const Color(0xFFEC928E);
  final Color k400 = const Color(0xFFE46962);
  final Color k500 = const Color(0xFFDC362E);
  final Color k600 = const Color(0xFFB3261E);
  final Color k700 = const Color(0xFF8C1D18);
  final Color k800 = const Color(0xFF601410);
  final Color k900 = const Color(0xFF410E0B);
}

class _CustomMauvewoodColors {
  final Color k25 = const Color(0xFFFFF7FD);
  final Color k50 = const Color(0xFFFFECF1);
  final Color k100 = const Color(0xFFFFD8E4);
  final Color k200 = const Color(0xFFEFB8C8);
  final Color k300 = const Color(0xFFD29DAC);
  final Color k400 = const Color(0xFFB58392);
  final Color k500 = const Color(0xFF986977);
  final Color k600 = const Color(0xFF7D5260);
  final Color k700 = const Color(0xFF633B48);
  final Color k800 = const Color(0xFF492532);
  final Color k900 = const Color(0xFF31111D);
}

class _CustomBlackCoralColors {
  final Color k0 = const Color(0xFFFFFFFF);
  final Color k25 = const Color(0xFFFEF7FF);
  final Color k50 = const Color(0xFFF5EFF7);
  final Color k100 = const Color(0xFFE6E0E9);
  final Color k200 = const Color(0xFFCAC5CD);
  final Color k300 = const Color(0xFFAEA9B1);
  final Color k400 = const Color(0xFF938F96);
  final Color k500 = const Color(0xFF79767D);
  final Color k600 = const Color(0xFF605D64);
  final Color k700 = const Color(0xFF48464C);
  final Color k800 = const Color(0xFF322F35);
  final Color k900 = const Color(0xFF1D1B20);
  final Color k1000 = const Color(0xFF000000);
}

class _CustomBackgroundPrimaryColors {
  final Color defaultEnabled = CustomColors.purple.k600;
  final Color defaultPressed = CustomColors.purple.k700;
  final Color subtleEnabled = CustomColors.purple.k100;
  final Color subtlePressed = CustomColors.purple.k200;
  final Color subtlerEnabled = CustomColors.purple.k25;
  final Color subtlerPressed = CustomColors.purple.k50;
}

class _CustomBackgroundSecondaryColors {
  final Color defaultEnabled = CustomColors.quartz.k600;
  final Color defaultPressed = CustomColors.quartz.k700;
  final Color subtleEnabled = CustomColors.quartz.k100;
  final Color subtlePressed = CustomColors.quartz.k200;
  final Color subtlerEnabled = CustomColors.quartz.k25;
  final Color subtlerPressed = CustomColors.quartz.k50;
}

class _CustomBackgroundTertiaryColors {
  final Color defaultEnabled = CustomColors.mauvewood.k600;
  final Color defaultPressed = CustomColors.mauvewood.k700;
  final Color subtleEnabled = CustomColors.mauvewood.k100;
  final Color subtlePressed = CustomColors.mauvewood.k200;
  final Color subtlerEnabled = CustomColors.mauvewood.k25;
  final Color subtlerPressed = CustomColors.mauvewood.k50;
}

class _CustomBackgroundErrorColors {
  final Color defaultEnabled = CustomColors.red.k600;
  final Color defaultPressed = CustomColors.red.k700;
  final Color subtleEnabled = CustomColors.red.k100;
  final Color subtlePressed = CustomColors.red.k200;
  final Color subtlerEnabled = CustomColors.red.k25;
  final Color subtlerPressed = CustomColors.red.k50;
}

class _CustomBackgroundNeutralColors {
  final Color defaultEnabled = CustomColors.grey.k600;
  final Color defaultPressed = CustomColors.grey.k700;
  final Color subtleEnabled = CustomColors.grey.k50;
  final Color subtlePressed = CustomColors.grey.k100;
  final Color subtlerEnabled = CustomColors.grey.k0;
  final Color subtlerPressed = CustomColors.grey.k50;
}

class _CustomBackgroundColors {
  final Color disabled = const Color(0xFFF5EFF7).withOpacity(0.4);
  final _CustomBackgroundPrimaryColors primary = _CustomBackgroundPrimaryColors();
  final _CustomBackgroundSecondaryColors secondary = _CustomBackgroundSecondaryColors();
  final _CustomBackgroundTertiaryColors tertiary = _CustomBackgroundTertiaryColors();
  final _CustomBackgroundErrorColors error = _CustomBackgroundErrorColors();
  final _CustomBackgroundNeutralColors neutral = _CustomBackgroundNeutralColors();
}

class _CustomTextPrimaryColors {
  final Color defaultt = CustomColors.purple.k600;
  final Color bold = CustomColors.purple.k800;
}

class _CustomTextSecondaryColors {
  final Color defaultt = CustomColors.quartz.k600;
  final Color bold = CustomColors.quartz.k800;
}

class _CustomTextTertiaryColors {
  final Color defaultt = CustomColors.mauvewood.k600;
  final Color bold = CustomColors.mauvewood.k800;
}

class _CustomTextErrorColors {
  final Color defaultt = CustomColors.red.k600;
  final Color bold = CustomColors.red.k800;
}

class _CustomTextNeutralColors {
  final Color subtler = CustomColors.grey.k500;
  final Color subtle = CustomColors.grey.k600;
  final Color defaultt = CustomColors.grey.k700;
  final Color bold = CustomColors.grey.k800;
}

class _CustomTextColors {
  final Color inverse = CustomColors.grey.k0;
  final Color disabled = CustomColors.grey.k300;
  final _CustomTextPrimaryColors primary = _CustomTextPrimaryColors();
  final _CustomTextSecondaryColors secondary = _CustomTextSecondaryColors();
  final _CustomTextTertiaryColors tertiary = _CustomTextTertiaryColors();
  final _CustomTextErrorColors error = _CustomTextErrorColors();
  final _CustomTextNeutralColors neutral = _CustomTextNeutralColors();
}

class _CustomIconPrimaryColors {
  final Color defaultt = CustomColors.purple.k600;
  final Color bold = CustomColors.purple.k800;
}

class _CustomIconSecondaryColors {
  final Color defaultt = CustomColors.quartz.k600;
  final Color bold = CustomColors.quartz.k800;
}

class _CustomIconTertiaryColors {
  final Color defaultt = CustomColors.mauvewood.k600;
  final Color bold = CustomColors.mauvewood.k800;
}

class _CustomIconErrorColors {
  final Color defaultt = CustomColors.red.k600;
  final Color bold = CustomColors.red.k800;
}

class _CustomIconNeutralColors {
  final Color subtle = CustomColors.grey.k600;
  final Color defaultt = CustomColors.grey.k700;
  final Color bold = CustomColors.grey.k800;
}

class _CustomIconColors {
  final _CustomIconPrimaryColors primary = _CustomIconPrimaryColors();
  final _CustomIconSecondaryColors secondary = _CustomIconSecondaryColors();
  final _CustomIconTertiaryColors tertiary = _CustomIconTertiaryColors();
  final _CustomIconErrorColors red = _CustomIconErrorColors();
  final _CustomIconNeutralColors neutral = _CustomIconNeutralColors();
  final Color disabled = CustomColors.grey.k300;
  final Color inverse = CustomColors.grey.k0;
}

class _CustomBorderPrimaryColors {
  final Color defaultt = CustomColors.purple.k600;
}

class _CustomBorderSecondaryColors {
  final Color defaultt = CustomColors.quartz.k600;
}

class _CustomBorderTertiaryColors {
  final Color defaultt = CustomColors.mauvewood.k600;
}

class _CustomBorderErrorColors {
  final Color defaultt = CustomColors.red.k600;
}

class _CustomBorderNeutralColors {
  final Color defaultt = CustomColors.grey.k200;
}

class _CustomBorderColors {
  final Color disabled = CustomColors.grey.k100;
  final Color pressed = CustomColors.purple.k600;
  final _CustomBorderPrimaryColors primary = _CustomBorderPrimaryColors();
  final _CustomBorderSecondaryColors secondary = _CustomBorderSecondaryColors();
  final _CustomBorderTertiaryColors tertiary = _CustomBorderTertiaryColors();
  final _CustomBorderErrorColors error = _CustomBorderErrorColors();
  final _CustomBorderNeutralColors neutral = _CustomBorderNeutralColors();
}

class _CustomSurfaceColors {
  final Color subtlest = CustomColors.grey.k0;
  final Color subtler = CustomColors.grey.k25;
  final Color subtle = CustomColors.grey.k50;
  final Color defaultt = CustomColors.grey.k100;
  final Color bold = CustomColors.grey.k200;
  final Color bolder = CustomColors.grey.k300;
  final Color boldest = CustomColors.grey.k400;
}

abstract final class CustomColors {
  static final _CustomGreyColors grey = _CustomGreyColors();
  static final _CustomPurpleColors purple = _CustomPurpleColors();
  static final _CustomQuartzColors quartz = _CustomQuartzColors();
  static final _CustomRedColors red = _CustomRedColors();
  static final _CustomMauvewoodColors mauvewood = _CustomMauvewoodColors();
  static final _CustomBlackCoralColors blackCoral = _CustomBlackCoralColors();
  static final _CustomBackgroundColors background = _CustomBackgroundColors();
  static final _CustomTextColors text = _CustomTextColors();
  static final _CustomIconColors icon = _CustomIconColors();
  static final _CustomBorderColors border = _CustomBorderColors();
  static final _CustomSurfaceColors surface = _CustomSurfaceColors();

  static final Color transparent = const Color(0x00FFFFFF);
}

///BUTTON
class _CustomButtonColorsClass {
  final Color bgEnabled;
  final Color bgPressed;
  final Color bgDisabled;
  final Color borderEnabled;
  final Color borderPressed;
  final Color borderDisabled;
  final Color textEnabled;
  final Color textPressed;
  final Color textDisabled;

  _CustomButtonColorsClass({
    required this.bgEnabled,
    required this.bgPressed,
    required this.bgDisabled,
    required this.borderEnabled,
    required this.borderPressed,
    required this.borderDisabled,
    required this.textEnabled,
    required this.textPressed,
    required this.textDisabled
  });
}

class _CustomPrimaryButtonColors {
  final _CustomButtonColorsClass filled = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.primary.defaultEnabled,
    bgPressed: CustomColors.background.primary.defaultPressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.primary.defaultEnabled,
    borderPressed: CustomColors.background.primary.defaultPressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.text.inverse,
    textPressed: CustomColors.text.inverse,
    textDisabled: CustomColors.text.disabled
  );
  final _CustomButtonColorsClass outlined = _CustomButtonColorsClass(
    bgEnabled: CustomColors.transparent,
    bgPressed: CustomColors.background.primary.subtlerPressed,
    bgDisabled: CustomColors.transparent,
    borderEnabled: CustomColors.border.primary.defaultt,
    borderPressed: CustomColors.background.primary.defaultPressed,
    borderDisabled: CustomColors.border.disabled,
    textEnabled: CustomColors.border.primary.defaultt,
    textPressed: CustomColors.background.primary.defaultPressed,
    textDisabled: CustomColors.text.disabled,
  );
  final _CustomButtonColorsClass tonal = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.primary.subtleEnabled,
    bgPressed: CustomColors.background.primary.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.primary.subtleEnabled,
    borderPressed: CustomColors.background.primary.subtlePressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.text.primary.bold,
    textPressed: CustomColors.text.primary.bold,
    textDisabled: CustomColors.text.disabled,
  );
  final _CustomButtonColorsClass text = _CustomButtonColorsClass(
    bgEnabled: CustomColors.transparent,
    bgPressed: CustomColors.background.primary.subtlerPressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.transparent,
    borderPressed: CustomColors.background.primary.subtlerPressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.text.primary.bold,
    textPressed: CustomColors.text.primary.bold,
    textDisabled: CustomColors.text.disabled,
  );
}

class _CustomErrorButtonColors {
  final _CustomButtonColorsClass filled = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.error.defaultEnabled,
    bgPressed: CustomColors.background.error.defaultPressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.error.defaultEnabled,
    borderPressed: CustomColors.background.error.defaultPressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.text.inverse,
    textPressed: CustomColors.text.inverse,
    textDisabled: CustomColors.text.disabled,
  );
  final _CustomButtonColorsClass outlined = _CustomButtonColorsClass(
    bgEnabled: CustomColors.transparent,
    bgPressed: CustomColors.background.error.subtlerPressed,
    bgDisabled: CustomColors.transparent,
    borderEnabled: CustomColors.border.error.defaultt,
    borderPressed: CustomColors.border.error.defaultt,
    borderDisabled: CustomColors.border.disabled,
    textEnabled: CustomColors.border.error.defaultt,
    textPressed: CustomColors.border.error.defaultt,
    textDisabled: CustomColors.text.disabled,
  );
  final _CustomButtonColorsClass tonal = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.error.subtleEnabled,
    bgPressed: CustomColors.background.error.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.error.subtleEnabled,
    borderPressed: CustomColors.background.error.subtlePressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.text.error.bold,
    textPressed: CustomColors.text.error.bold,
    textDisabled: CustomColors.text.disabled,
  );
  final _CustomButtonColorsClass text = _CustomButtonColorsClass(
    bgEnabled: CustomColors.transparent,
    bgPressed: CustomColors.background.error.subtlerPressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.transparent,
    borderPressed: CustomColors.background.error.subtlerPressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.text.error.bold,
    textPressed: CustomColors.text.error.bold,
    textDisabled: CustomColors.text.disabled,
  );
}

abstract final class CustomButtonColors {
  static final _CustomPrimaryButtonColors _primary = _CustomPrimaryButtonColors();
  static final _CustomErrorButtonColors _error = _CustomErrorButtonColors();

  static Color getBackgroundStart(CustomButtonType type) {
    switch (type) {
      case CustomButtonType.primaryFilled:
        return _primary.filled.bgEnabled;
      case CustomButtonType.primaryOutlined:
        return _primary.outlined.bgEnabled;
      case CustomButtonType.primaryTonal:
        return _primary.tonal.bgEnabled;
      case CustomButtonType.primaryText:
        return _primary.text.bgEnabled;
      case CustomButtonType.errorFilled:
        return _error.filled.bgEnabled;
      case CustomButtonType.errorOutlined:
        return _error.outlined.bgEnabled;
      case CustomButtonType.errorTonal:
        return _error.tonal.bgEnabled;
      case CustomButtonType.errorText:
        return _error.text.bgEnabled;
    }
  }

  static Color getBackgroundEnd(CustomButtonType type, bool disabled) {
    switch (type) {
      case CustomButtonType.primaryFilled:
        return disabled ? _primary.filled.bgDisabled : _primary.filled.bgPressed;
      case CustomButtonType.primaryOutlined:
        return disabled ? _primary.outlined.bgDisabled : _primary.outlined.bgPressed;
      case CustomButtonType.primaryTonal:
        return disabled ? _primary.tonal.bgDisabled : _primary.tonal.bgPressed;
      case CustomButtonType.primaryText:
        return disabled ? _primary.text.bgDisabled : _primary.text.bgPressed;
      case CustomButtonType.errorFilled:
        return disabled ? _error.filled.bgDisabled : _error.filled.bgPressed;
      case CustomButtonType.errorOutlined:
        return disabled ? _error.outlined.bgDisabled : _error.outlined.bgPressed;
      case CustomButtonType.errorTonal:
        return disabled ? _error.tonal.bgDisabled : _error.tonal.bgPressed;
      case CustomButtonType.errorText:
        return disabled ? _error.text.bgDisabled : _error.text.bgPressed;
    }
  }

  static Color getBorderStart(CustomButtonType type) {
    switch (type) {
      case CustomButtonType.primaryFilled:
        return _primary.filled.borderEnabled;
      case CustomButtonType.primaryOutlined:
        return _primary.outlined.borderEnabled;
      case CustomButtonType.primaryTonal:
        return _primary.tonal.borderEnabled;
      case CustomButtonType.primaryText:
        return _primary.text.borderEnabled;
      case CustomButtonType.errorFilled:
        return _error.filled.borderEnabled;
      case CustomButtonType.errorOutlined:
        return _error.outlined.borderEnabled;
      case CustomButtonType.errorTonal:
        return _error.tonal.borderEnabled;
      case CustomButtonType.errorText:
        return _error.text.borderEnabled;
    }
  }

  static Color getBorderEnd(CustomButtonType type, bool disabled) {
    switch (type) {
      case CustomButtonType.primaryFilled:
        return disabled ? _primary.filled.borderDisabled : _primary.filled.borderPressed;
      case CustomButtonType.primaryOutlined:
        return disabled ? _primary.outlined.borderDisabled : _primary.outlined.borderPressed;
      case CustomButtonType.primaryTonal:
        return disabled ? _primary.tonal.borderDisabled : _primary.tonal.borderPressed;
      case CustomButtonType.primaryText:
        return disabled ? _primary.text.borderDisabled : _primary.text.borderPressed;
      case CustomButtonType.errorFilled:
        return disabled ? _error.filled.borderDisabled : _error.filled.borderPressed;
      case CustomButtonType.errorOutlined:
        return disabled ? _error.outlined.borderDisabled : _error.outlined.borderPressed;
      case CustomButtonType.errorTonal:
        return disabled ? _error.tonal.borderDisabled : _error.tonal.borderPressed;
      case CustomButtonType.errorText:
        return disabled ? _error.text.borderDisabled : _error.text.borderPressed;
    }
  }

  static Color getTextStart(CustomButtonType type) {
    switch (type) {
      case CustomButtonType.primaryFilled:
        return _primary.filled.textEnabled;
      case CustomButtonType.primaryOutlined:
        return _primary.outlined.textEnabled;
      case CustomButtonType.primaryTonal:
        return _primary.tonal.textEnabled;
      case CustomButtonType.primaryText:
        return _primary.text.textEnabled;
      case CustomButtonType.errorFilled:
        return _error.filled.textEnabled;
      case CustomButtonType.errorOutlined:
        return _error.outlined.textEnabled;
      case CustomButtonType.errorTonal:
        return _error.tonal.textEnabled;
      case CustomButtonType.errorText:
        return _error.text.textEnabled;
    }
  }

  static Color getTextEnd(CustomButtonType type, bool disabled) {
    switch (type) {
      case CustomButtonType.primaryFilled:
        return disabled ? _primary.filled.textDisabled : _primary.filled.textPressed;
      case CustomButtonType.primaryOutlined:
        return disabled ? _primary.outlined.textDisabled : _primary.outlined.textPressed;
      case CustomButtonType.primaryTonal:
        return disabled ? _primary.tonal.textDisabled : _primary.tonal.textPressed;
      case CustomButtonType.primaryText:
        return disabled ? _primary.text.textDisabled : _primary.text.textPressed;
      case CustomButtonType.errorFilled:
        return disabled ? _error.filled.textDisabled : _error.filled.textPressed;
      case CustomButtonType.errorOutlined:
        return disabled ? _error.outlined.textDisabled : _error.outlined.textPressed;
      case CustomButtonType.errorTonal:
        return disabled ? _error.tonal.textDisabled : _error.tonal.textPressed;
      case CustomButtonType.errorText:
        return disabled ? _error.text.textDisabled : _error.text.textPressed;
    }
  }
}

///ICON BUTTON
class _CustomPrimaryIconButtonColors {
  final _CustomButtonColorsClass filled = _CustomButtonColorsClass(
      bgEnabled: CustomColors.background.primary.defaultEnabled,
      bgPressed: CustomColors.background.primary.defaultPressed,
      bgDisabled: CustomColors.background.disabled,
      borderEnabled: CustomColors.background.primary.defaultEnabled,
      borderPressed: CustomColors.background.primary.defaultPressed,
      borderDisabled: CustomColors.background.disabled,
      textEnabled: CustomColors.text.inverse,
      textPressed: CustomColors.text.inverse,
      textDisabled: CustomColors.text.disabled
  );
  final _CustomButtonColorsClass tonal = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.primary.subtleEnabled,
    bgPressed: CustomColors.background.primary.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.primary.subtleEnabled,
    borderPressed: CustomColors.background.primary.subtlePressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.text.primary.bold,
    textPressed: CustomColors.text.primary.bold,
    textDisabled: CustomColors.text.disabled,
  );
  final _CustomButtonColorsClass standard = _CustomButtonColorsClass(
    bgEnabled: CustomColors.transparent,
    bgPressed: CustomColors.background.primary.subtlerPressed,
    bgDisabled: CustomColors.transparent,
    borderEnabled: CustomColors.transparent,
    borderPressed: CustomColors.background.primary.subtlerPressed,
    borderDisabled: CustomColors.transparent,
    textEnabled: CustomColors.text.primary.defaultt,
    textPressed: CustomColors.text.primary.defaultt,
    textDisabled: CustomColors.text.disabled,
  );
}

class _CustomErrorIconButtonColors {
  final _CustomButtonColorsClass filled = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.error.defaultEnabled,
    bgPressed: CustomColors.background.error.defaultPressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.error.defaultEnabled,
    borderPressed: CustomColors.background.error.defaultPressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.text.inverse,
    textPressed: CustomColors.text.inverse,
    textDisabled: CustomColors.text.disabled,
  );
  final _CustomButtonColorsClass tonal = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.error.subtleEnabled,
    bgPressed: CustomColors.background.error.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.error.subtleEnabled,
    borderPressed: CustomColors.background.error.subtlePressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.text.error.bold,
    textPressed: CustomColors.text.error.bold,
    textDisabled: CustomColors.text.disabled,
  );
  final _CustomButtonColorsClass standard = _CustomButtonColorsClass(
    bgEnabled: CustomColors.transparent,
    bgPressed: CustomColors.background.error.subtlerPressed,
    bgDisabled: CustomColors.transparent,
    borderEnabled: CustomColors.transparent,
    borderPressed: CustomColors.background.error.subtlerPressed,
    borderDisabled: CustomColors.transparent,
    textEnabled: CustomColors.text.error.defaultt,
    textPressed: CustomColors.text.error.defaultt,
    textDisabled: CustomColors.text.disabled,
  );
}

abstract final class CustomIconButtonColors {
  static final _CustomPrimaryIconButtonColors _primary = _CustomPrimaryIconButtonColors();
  static final _CustomErrorIconButtonColors _error = _CustomErrorIconButtonColors();

  static Color getBackgroundStart(CustomIconButtonType type) {
    switch (type) {
      case CustomIconButtonType.primaryFilled:
        return _primary.filled.bgEnabled;
      case CustomIconButtonType.primaryTonal:
        return _primary.tonal.bgEnabled;
      case CustomIconButtonType.primaryStandard:
        return _primary.standard.bgEnabled;
      case CustomIconButtonType.errorFilled:
        return _error.filled.bgEnabled;
      case CustomIconButtonType.errorTonal:
        return _error.tonal.bgEnabled;
      case CustomIconButtonType.errorStandard:
        return _error.standard.bgEnabled;
      case CustomIconButtonType.textField:
        return _primary.standard.bgEnabled;
    }
  }

  static Color getBackgroundEnd(CustomIconButtonType type, bool disabled) {
    switch (type) {
      case CustomIconButtonType.primaryFilled:
        return disabled ? _primary.filled.bgDisabled : _primary.filled.bgPressed;
      case CustomIconButtonType.primaryTonal:
        return disabled ? _primary.tonal.bgDisabled : _primary.tonal.bgPressed;
      case CustomIconButtonType.primaryStandard:
        return disabled ? _primary.standard.bgDisabled : _primary.standard.bgPressed;
      case CustomIconButtonType.errorFilled:
        return disabled ? _error.filled.bgDisabled : _error.filled.bgPressed;
      case CustomIconButtonType.errorTonal:
        return disabled ? _error.tonal.bgDisabled : _error.tonal.bgPressed;
      case CustomIconButtonType.errorStandard:
        return disabled ? _error.standard.bgDisabled : _error.standard.bgPressed;
      case CustomIconButtonType.textField:
        return _primary.standard.bgPressed;
    }
  }

  static Color getBorderStart(CustomIconButtonType type) {
    switch (type) {
      case CustomIconButtonType.primaryFilled:
        return _primary.filled.borderEnabled;
      case CustomIconButtonType.primaryTonal:
        return _primary.tonal.borderEnabled;
      case CustomIconButtonType.primaryStandard:
        return _primary.standard.borderEnabled;
      case CustomIconButtonType.errorFilled:
        return _error.filled.borderEnabled;
      case CustomIconButtonType.errorTonal:
        return _error.tonal.borderEnabled;
      case CustomIconButtonType.errorStandard:
        return _error.standard.borderEnabled;
      case CustomIconButtonType.textField:
        return _primary.standard.borderEnabled;
    }
  }

  static Color getBorderEnd(CustomIconButtonType type, bool disabled) {
    switch (type) {
      case CustomIconButtonType.primaryFilled:
        return disabled ? _primary.filled.borderDisabled : _primary.filled.borderPressed;
      case CustomIconButtonType.primaryTonal:
        return disabled ? _primary.tonal.borderDisabled : _primary.tonal.borderPressed;
      case CustomIconButtonType.primaryStandard:
        return disabled ? _primary.standard.borderDisabled : _primary.standard.borderPressed;
      case CustomIconButtonType.errorFilled:
        return disabled ? _error.filled.borderDisabled : _error.filled.borderPressed;
      case CustomIconButtonType.errorTonal:
        return disabled ? _error.tonal.borderDisabled : _error.tonal.borderPressed;
      case CustomIconButtonType.errorStandard:
        return disabled ? _error.standard.borderDisabled : _error.standard.borderPressed;
      case CustomIconButtonType.textField:
        return _primary.standard.borderPressed;
    }
  }

  static Color getTextStart(CustomIconButtonType type) {
    switch (type) {
      case CustomIconButtonType.primaryFilled:
        return _primary.filled.textEnabled;
      case CustomIconButtonType.primaryTonal:
        return _primary.tonal.textEnabled;
      case CustomIconButtonType.primaryStandard:
        return _primary.standard.textEnabled;
      case CustomIconButtonType.errorFilled:
        return _error.filled.textEnabled;
      case CustomIconButtonType.errorTonal:
        return _error.tonal.textEnabled;
      case CustomIconButtonType.errorStandard:
        return _error.standard.textEnabled;
      case CustomIconButtonType.textField:
        return CustomColors.icon.neutral.subtle;
    }
  }

  static Color getTextEnd(CustomIconButtonType type, bool disabled) {
    switch (type) {
      case CustomIconButtonType.primaryFilled:
        return disabled ? _primary.filled.textDisabled : _primary.filled.textPressed;
      case CustomIconButtonType.primaryTonal:
        return disabled ? _primary.tonal.textDisabled : _primary.tonal.textPressed;
      case CustomIconButtonType.primaryStandard:
        return disabled ? _primary.standard.textDisabled : _primary.standard.textPressed;
      case CustomIconButtonType.errorFilled:
        return disabled ? _error.filled.textDisabled : _error.filled.textPressed;
      case CustomIconButtonType.errorTonal:
        return disabled ? _error.tonal.textDisabled : _error.tonal.textPressed;
      case CustomIconButtonType.errorStandard:
        return disabled ? _error.standard.textDisabled : _error.standard.textPressed;
      case CustomIconButtonType.textField:
        return CustomColors.icon.neutral.subtle;
    }
  }
}

///FLOATING ACTION BUTTON
abstract final class CustomFloatingActionButtonColors {
  static final _CustomButtonColorsClass _primary = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.primary.subtleEnabled,
    bgPressed: CustomColors.background.primary.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.primary.subtleEnabled,
    borderPressed: CustomColors.background.primary.subtlePressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.icon.primary.bold,
    textPressed: CustomColors.icon.primary.bold,
    textDisabled: CustomColors.icon.disabled,
  );
  static final _CustomButtonColorsClass _secondary = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.secondary.subtleEnabled,
    bgPressed: CustomColors.background.secondary.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.secondary.subtleEnabled,
    borderPressed: CustomColors.background.secondary.subtlePressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.icon.secondary.bold,
    textPressed: CustomColors.icon.secondary.bold,
    textDisabled: CustomColors.icon.disabled,
  );
  static final _CustomButtonColorsClass _tertiary = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.tertiary.subtleEnabled,
    bgPressed: CustomColors.background.tertiary.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.background.tertiary.subtleEnabled,
    borderPressed: CustomColors.background.tertiary.subtlePressed,
    borderDisabled: CustomColors.background.disabled,
    textEnabled: CustomColors.icon.tertiary.bold,
    textPressed: CustomColors.icon.tertiary.bold,
    textDisabled: CustomColors.icon.disabled,
  );

  static Color getBackgroundStart(CustomFloatingActionButtonType type) {
    switch (type) {
      case CustomFloatingActionButtonType.primary:
        return _primary.bgEnabled;
      case CustomFloatingActionButtonType.secondary:
        return _secondary.bgEnabled;
      case CustomFloatingActionButtonType.tertiary:
        return _tertiary.bgEnabled;
    }
  }

  static Color getBackgroundEnd(CustomFloatingActionButtonType type, bool disabled) {
    switch (type) {
      case CustomFloatingActionButtonType.primary:
        return disabled ? _primary.bgDisabled : _primary.bgPressed;
      case CustomFloatingActionButtonType.secondary:
        return disabled ? _secondary.bgDisabled : _secondary.bgPressed;
      case CustomFloatingActionButtonType.tertiary:
        return disabled ? _tertiary.bgDisabled : _tertiary.bgPressed;
    }
  }

  static Color getBorderStart(CustomFloatingActionButtonType type) {
    switch (type) {
      case CustomFloatingActionButtonType.primary:
        return _primary.borderEnabled;
      case CustomFloatingActionButtonType.secondary:
        return _secondary.borderEnabled;
      case CustomFloatingActionButtonType.tertiary:
        return _tertiary.borderEnabled;
    }
  }

  static Color getBorderEnd(CustomFloatingActionButtonType type, bool disabled) {
    switch (type) {
      case CustomFloatingActionButtonType.primary:
        return disabled ? _primary.borderDisabled : _primary.borderPressed;
      case CustomFloatingActionButtonType.secondary:
        return disabled ? _secondary.borderDisabled : _secondary.borderPressed;
      case CustomFloatingActionButtonType.tertiary:
        return disabled ? _tertiary.borderDisabled : _tertiary.borderPressed;
    }
  }

  static Color getTextStart(CustomFloatingActionButtonType type) {
    switch (type) {
      case CustomFloatingActionButtonType.primary:
        return _primary.textEnabled;
      case CustomFloatingActionButtonType.secondary:
        return _secondary.textEnabled;
      case CustomFloatingActionButtonType.tertiary:
        return _tertiary.textEnabled;
    }
  }

  static Color getTextEnd(CustomFloatingActionButtonType type, bool disabled) {
    switch (type) {
      case CustomFloatingActionButtonType.primary:
        return disabled ? _primary.textDisabled : _primary.textPressed;
      case CustomFloatingActionButtonType.secondary:
        return disabled ? _secondary.textDisabled : _secondary.textPressed;
      case CustomFloatingActionButtonType.tertiary:
        return disabled ? _tertiary.textDisabled : _tertiary.textPressed;
    }
  }
}

///SEARCH BAR COLORS
abstract final class CustomSearchBarColors {
  static final _CustomButtonColorsClass defaultt = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.neutral.subtleEnabled,
    bgPressed: CustomColors.background.neutral.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.border.neutral.defaultt,
    borderPressed: CustomColors.border.pressed,
    borderDisabled: CustomColors.border.disabled,
    textEnabled: CustomColors.text.neutral.subtler,
    textPressed: CustomColors.text.neutral.defaultt,
    textDisabled: CustomColors.text.disabled,
  );
}


///TEXT FIELD COLORS
abstract final class CustomTextFieldColors {
  static final _CustomButtonColorsClass defaultt = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.neutral.subtleEnabled,
    bgPressed: CustomColors.background.neutral.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.border.neutral.defaultt,
    borderPressed: CustomColors.border.pressed,
    borderDisabled: CustomColors.border.disabled,
    textEnabled: CustomColors.text.neutral.subtler,
    textPressed: CustomColors.text.neutral.defaultt,
    textDisabled: CustomColors.text.disabled,
  );

  static final _CustomButtonColorsClass error = _CustomButtonColorsClass(
    bgEnabled: CustomColors.background.neutral.subtleEnabled,
    bgPressed: CustomColors.background.neutral.subtlePressed,
    bgDisabled: CustomColors.background.disabled,
    borderEnabled: CustomColors.border.error.defaultt,
    borderPressed: CustomColors.border.error.defaultt,
    borderDisabled: CustomColors.border.error.defaultt,
    textEnabled: CustomColors.text.error.defaultt,
    textPressed: CustomColors.text.error.defaultt,
    textDisabled: CustomColors.text.error.defaultt,
  );
}


///MATERIAL COLORS
class _MaterialPrimaryColors {
  final Color k0 = const Color(0xFF000000);
  final Color k10 = const Color(0xFF21005D);
  final Color k20 = const Color(0xFF381E72);
  final Color k30 = const Color(0xFF4F378B);
  final Color k40 = const Color(0xFF6750A4);
  final Color k50 = const Color(0xFF7F67BE);
  final Color k60 = const Color(0xFF9A82DB);
  final Color k70 = const Color(0xFFB69DF8);
  final Color k80 = const Color(0xFFD0BCFF);
  final Color k90 = const Color(0xFFEADDFF);
  final Color k95 = const Color(0xFFF6EDFF);
  final Color k98 = const Color(0xFFF8F9FF);
  final Color k100 = const Color(0xFFFFFFFF);
}

class _MaterialSecondaryColors {
  final Color k0 = const Color(0xFF000000);
  final Color k10 = const Color(0xFF1D192B);
  final Color k20 = const Color(0xFF332D41);
  final Color k30 = const Color(0xFF4A4458);
  final Color k40 = const Color(0xFF625B71);
  final Color k50 = const Color(0xFF7A7289);
  final Color k60 = const Color(0xFF958DA5);
  final Color k70 = const Color(0xFFB0A7C0);
  final Color k80 = const Color(0xFFCCC2DC);
  final Color k90 = const Color(0xFFEADDFF);
  final Color k95 = const Color(0xFFF6EDFF);
  final Color k98 = const Color(0xFFF8F9FF);
  final Color k100 = const Color(0xFFFFFFFF);
}

class _MaterialTertiaryColors {
  final Color k0 = const Color(0xFF000000);
  final Color k10 = const Color(0xFF31111D);
  final Color k20 = const Color(0xFF492532);
  final Color k30 = const Color(0xFF633B48);
  final Color k40 = const Color(0xFF7D5260);
  final Color k50 = const Color(0xFF986977);
  final Color k60 = const Color(0xFFB58392);
  final Color k70 = const Color(0xFFD29DAC);
  final Color k80 = const Color(0xFFEFB8C8);
  final Color k90 = const Color(0xFFFFD8E4);
  final Color k95 = const Color(0xFFFFECF1);
  final Color k98 = const Color(0xFFFFF7FD);
  final Color k100 = const Color(0xFFFFFFFF);
}

class _MaterialErrorColors {
  final Color k0 = const Color(0xFF000000);
  final Color k10 = const Color(0xFF410E0B);
  final Color k20 = const Color(0xFF601410);
  final Color k30 = const Color(0xFF8C1D18);
  final Color k40 = const Color(0xFFB3261E);
  final Color k50 = const Color(0xFFDC362E);
  final Color k60 = const Color(0xFFE46962);
  final Color k70 = const Color(0xFFEC928E);
  final Color k80 = const Color(0xFFF2B8B5);
  final Color k90 = const Color(0xFFF9DEDC);
  final Color k95 = const Color(0xFFFCEEEE);
  final Color k98 = const Color(0xFFFFF8F7);
  final Color k100 = const Color(0xFFFFFFFF);
}

class _MaterialNeutralColors {
  final Color k0 = const Color(0xFF000000);
  final Color k10 = const Color(0xFF1D1B20);
  final Color k20 = const Color(0xFF322F35);
  final Color k30 = const Color(0xFF48464C);
  final Color k40 = const Color(0xFF605D64);
  final Color k50 = const Color(0xFF79767D);
  final Color k60 = const Color(0xFF938F96);
  final Color k70 = const Color(0xFFAEA9B1);
  final Color k80 = const Color(0xFFCAC5CD);
  final Color k90 = const Color(0xFFE6E0E9);
  final Color k95 = const Color(0xFFF5EFF7);
  final Color k98 = const Color(0xFFFEF7FF);
  final Color k100 = const Color(0xFFFFFFFF);
}

abstract class MaterialColors {
  static final _MaterialPrimaryColors primary = _MaterialPrimaryColors();
  static final _MaterialSecondaryColors secondary = _MaterialSecondaryColors();
  static final _MaterialTertiaryColors tertiary = _MaterialTertiaryColors();
  static final _MaterialErrorColors error = _MaterialErrorColors();
  static final _MaterialNeutralColors neutral = _MaterialNeutralColors();
}
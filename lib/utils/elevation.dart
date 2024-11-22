import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CustomElevationKeys { k1Subtler, k2Subtle, k3Bold }

abstract final class CustomElevation {
  static final Map<int, BoxShadow> _elevation = {
    1: BoxShadow(
      color: const Color(0x29000000),
      offset: Offset(0, 1),
    ),
    2: BoxShadow(
      color: const Color(0x29000000),
      offset: Offset(0, 6),
    ),
    3: BoxShadow(
      color: const Color(0x2E000000),
      offset: Offset(0, 8),
    ),
  };

  static BoxShadow elevation(CustomElevationKeys key) {
    switch (key) {
      case CustomElevationKeys.k1Subtler:
        return _elevation[1]!;
      case CustomElevationKeys.k2Subtle:
        return _elevation[2]!;
      case CustomElevationKeys.k3Bold:
        return _elevation[3]!;
    }
  }
}
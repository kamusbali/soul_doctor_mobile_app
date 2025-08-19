import 'package:flutter/cupertino.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';

abstract class EffectTheme {
  EffectTheme._();

  static final SOFT_SHADOW = BoxShadow(
    color: ColorTheme.TEXT_100.withAlpha(25),
    offset: Offset(0, 2),
    blurRadius: 8,
  );

  static final MEDIUM_SHADOW = BoxShadow(
    color: ColorTheme.TEXT_100.withAlpha(25),
    offset: Offset(0, 16),
    blurRadius: 20,
    spreadRadius: 1,
  );

  static final HARD_SHADOW = BoxShadow(
    color: ColorTheme.TEXT_100.withAlpha(25),
    offset: Offset(0, 8),
    blurRadius: 10,
    spreadRadius: 1,
  );
}

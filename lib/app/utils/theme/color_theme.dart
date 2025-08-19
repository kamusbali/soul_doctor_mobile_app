import 'package:flutter/material.dart';

abstract class ColorTheme {
  ColorTheme._();

  static const SURFACE = Color(_ColorValue.SURFACE);

  static const TEXT_100 = Color(_ColorValue.TEXT_100);
  static const TEXT_200 = Color(_ColorValue.TEXT_200);
  static const TEXT_PLACEHOLDER = Color(_ColorValue.TEXT_PLACEHOLDER);

  static const NEUTRAL_100 = Color(_ColorValue.NEUTRAL_100);
  static const NEUTRAL_200 = Color(_ColorValue.NEUTRAL_200);
  static const NEUTRAL_300 = Color(_ColorValue.NEUTRAL_300);
  static const NEUTRAL_400 = Color(_ColorValue.NEUTRAL_400);
  static const NEUTRAL_500 = Color(_ColorValue.NEUTRAL_500);
  static const NEUTRAL_600 = Color(_ColorValue.NEUTRAL_600);
  static const NEUTRAL_700 = Color(_ColorValue.NEUTRAL_700);
  static const NEUTRAL_800 = Color(_ColorValue.NEUTRAL_800);
  static const NEUTRAL_900 = Color(_ColorValue.NEUTRAL_900);

  static const PERSIAN_BLUE_200 = Color(_ColorValue.PERSIAN_BLUE_200);
  static const PERSIAN_BLUE_300 = Color(_ColorValue.PERSIAN_BLUE_300);
  static const PERSIAN_BLUE_400 = Color(_ColorValue.PERSIAN_BLUE_400);
  static const PERSIAN_BLUE_500 = Color(_ColorValue.PERSIAN_BLUE_500);
  static const PERSIAN_BLUE_600 = Color(_ColorValue.PERSIAN_BLUE_600);
  static const PERSIAN_BLUE_700 = Color(_ColorValue.PERSIAN_BLUE_700);
  static const PERSIAN_BLUE_800 = Color(_ColorValue.PERSIAN_BLUE_800);

  static const EUCALYPTUS_200 = Color(_ColorValue.EUCALYPTUS_200);
  static const EUCALYPTUS_300 = Color(_ColorValue.EUCALYPTUS_300);
  static const EUCALYPTUS_400 = Color(_ColorValue.EUCALYPTUS_400);
  static const EUCALYPTUS_500 = Color(_ColorValue.EUCALYPTUS_500);
  static const EUCALYPTUS_600 = Color(_ColorValue.EUCALYPTUS_600);
  static const EUCALYPTUS_700 = Color(_ColorValue.EUCALYPTUS_700);
  static const EUCALYPTUS_800 = Color(_ColorValue.EUCALYPTUS_800);

  static const GAMBOGE_200 = Color(_ColorValue.GAMBOGE_200);
  static const GAMBOGE_300 = Color(_ColorValue.GAMBOGE_300);
  static const GAMBOGE_400 = Color(_ColorValue.GAMBOGE_400);
  static const GAMBOGE_500 = Color(_ColorValue.GAMBOGE_500);
  static const GAMBOGE_600 = Color(_ColorValue.GAMBOGE_600);
  static const GAMBOGE_700 = Color(_ColorValue.GAMBOGE_700);
  static const GAMBOGE_800 = Color(_ColorValue.GAMBOGE_800);

  static const COBALT_200 = Color(_ColorValue.COBALT_200);
  static const COBALT_300 = Color(_ColorValue.COBALT_300);
  static const COBALT_400 = Color(_ColorValue.COBALT_400);
  static const COBALT_500 = Color(_ColorValue.COBALT_500);
  static const COBALT_600 = Color(_ColorValue.COBALT_600);
  static const COBALT_700 = Color(_ColorValue.COBALT_700);
  static const COBALT_800 = Color(_ColorValue.COBALT_800);

  static const CRIMSON_200 = Color(_ColorValue.CRIMSON_200);
  static const CRIMSON_300 = Color(_ColorValue.CRIMSON_300);
  static const CRIMSON_400 = Color(_ColorValue.CRIMSON_400);
  static const CRIMSON_500 = Color(_ColorValue.CRIMSON_500);
  static const CRIMSON_600 = Color(_ColorValue.CRIMSON_600);
  static const CRIMSON_700 = Color(_ColorValue.CRIMSON_700);
  static const CRIMSON_800 = Color(_ColorValue.CRIMSON_800);

  static const DEEP_LEMON_200 = Color(_ColorValue.DEEP_LEMON_200);
  static const DEEP_LEMON_300 = Color(_ColorValue.DEEP_LEMON_300);
  static const DEEP_LEMON_400 = Color(_ColorValue.DEEP_LEMON_400);
  static const DEEP_LEMON_500 = Color(_ColorValue.DEEP_LEMON_500);
  static const DEEP_LEMON_600 = Color(_ColorValue.DEEP_LEMON_600);
  static const DEEP_LEMON_700 = Color(_ColorValue.DEEP_LEMON_700);
  static const DEEP_LEMON_800 = Color(_ColorValue.DEEP_LEMON_800);

  static const MINT_200 = Color(_ColorValue.MINT_200);
  static const MINT_300 = Color(_ColorValue.MINT_300);
  static const MINT_400 = Color(_ColorValue.MINT_400);
  static const MINT_500 = Color(_ColorValue.MINT_500);
  static const MINT_600 = Color(_ColorValue.MINT_600);
  static const MINT_700 = Color(_ColorValue.MINT_700);
  static const MINT_800 = Color(_ColorValue.MINT_800);
}

abstract class _ColorValue {
  _ColorValue._();

  static const SURFACE = 0xFFF5F6FA;

  static const TEXT_100 = 0xFF333333;
  static const TEXT_200 = 0xFF584B4C;
  static const TEXT_PLACEHOLDER = 0xFF676767;

  static const NEUTRAL_100 = 0xFFFFFFFF;
  static const NEUTRAL_200 = 0xFFFAFAFA;
  static const NEUTRAL_300 = 0xFFF2F2F2;
  static const NEUTRAL_400 = 0xFFF5F8FA;
  static const NEUTRAL_500 = 0xFFE0E0E0;
  static const NEUTRAL_600 = 0xFFC0C0C0;
  static const NEUTRAL_700 = 0xFFBDBDBD;
  static const NEUTRAL_800 = 0xFF828282;
  static const NEUTRAL_900 = 0xFF3A3A3A;

  static const PERSIAN_BLUE_200 = 0xFFEBEDFE;
  static const PERSIAN_BLUE_300 = 0xFF787AE8;
  static const PERSIAN_BLUE_400 = 0xFF5354D1;
  static const PERSIAN_BLUE_500 = 0xFF2325B3;
  static const PERSIAN_BLUE_600 = 0xFF191B99;
  static const PERSIAN_BLUE_700 = 0xFF111280;
  static const PERSIAN_BLUE_800 = 0xFF060755;

  static const EUCALYPTUS_200 = 0xFFDCFCE3;
  static const EUCALYPTUS_300 = 0xFF96F1BA;
  static const EUCALYPTUS_400 = 0xFF78E4AD;
  static const EUCALYPTUS_500 = 0xFF4ED39D;
  static const EUCALYPTUS_600 = 0xFF39B58F;
  static const EUCALYPTUS_700 = 0xFF279780;
  static const EUCALYPTUS_800 = 0xFF0E6564;

  static const GAMBOGE_200 = 0xFFFEF3CC;
  static const GAMBOGE_300 = 0xFFF9CE68;
  static const GAMBOGE_400 = 0xFFF3B943;
  static const GAMBOGE_500 = 0xFFEC9808;
  static const GAMBOGE_600 = 0xFFCA7A05;
  static const GAMBOGE_700 = 0xFFA96004;
  static const GAMBOGE_800 = 0xFF713701;

  static const COBALT_200 = 0xFFCEE9FE;
  static const COBALT_300 = 0xFF6DB0FA;
  static const COBALT_400 = 0xFF4894F5;
  static const COBALT_500 = 0xFF0F68EF;
  static const COBALT_600 = 0xFF0A50CD;
  static const COBALT_700 = 0xFF073BAC;
  static const COBALT_800 = 0xFF021D72;

  static const CRIMSON_200 = 0xFFFFE4D7;
  static const CRIMSON_300 = 0xFFFF9C87;
  static const CRIMSON_400 = 0xFFFF7669;
  static const CRIMSON_500 = 0xFFFF3838;
  static const CRIMSON_600 = 0xFFDB2838;
  static const CRIMSON_700 = 0xFFB71C37;
  static const CRIMSON_800 = 0xFF7A0A31;

  static const DEEP_LEMON_200 = 0xFFFEF9D1;
  static const DEEP_LEMON_300 = 0xFFFEE776;
  static const DEEP_LEMON_400 = 0xFFFDDE53;
  static const DEEP_LEMON_500 = 0xFFFDCE1B;
  static const DEEP_LEMON_600 = 0xFFD9AC13;
  static const DEEP_LEMON_700 = 0xFFB68B0D;
  static const DEEP_LEMON_800 = 0xFF795705;

  static const MINT_200 = 0xFFCAFADF;
  static const MINT_300 = 0xFF61E3B3;
  static const MINT_400 = 0xFF39C7A0;
  static const MINT_500 = 0xFF39C7A0;
  static const MINT_600 = 0xFF08A387;
  static const MINT_700 = 0xFF047475;
  static const MINT_800 = 0xFF013F4E;
}

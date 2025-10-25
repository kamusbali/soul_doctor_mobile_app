import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

class CardAccountAuthentication extends StatelessWidget {
  const CardAccountAuthentication({
    super.key,
    required this.onRegister,
    required this.onLogin,
  });

  final void Function() onRegister;
  final void Function() onLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(
        left: SpacingTheme.SPACING_8,
        right: SpacingTheme.SPACING_8,
        bottom: SpacingTheme.SPACING_11,
        top: 80,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ConstPath.BACKGROUND_AUTHENTICATION_PROFILE_PATH),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        spacing: SpacingTheme.SPACING_8,
        children: [
          Text(
            "Masuk untuk mendapatkan akses penuh ke seluruh layanan dan fitur yang kami sediakan.",
            style: TextStyleTheme.PARAGRAPH_5.copyWith(
              color: ColorTheme.TEXT_100,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: onLogin,
                child: Text(
                  "Masuk",
                  style: TextStyleTheme.LABEL_1.copyWith(
                    color: ColorTheme.NEUTRAL_100,
                  ),
                ),
              ),
              SizedBox(width: SpacingTheme.SPACING_4),
              OutlinedButton(
                onPressed: onRegister,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10000),
                  ),
                  backgroundColor: ColorTheme.NEUTRAL_100,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  side: BorderSide(
                    width: 2,
                    color: ColorTheme.CRIMSON_500,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
                child: Text(
                  "Daftar",
                  style: TextStyleTheme.LABEL_1.copyWith(
                    color: ColorTheme.CRIMSON_500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

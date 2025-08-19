import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';

class UnauthorizedDialog extends StatelessWidget {
  const UnauthorizedDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Get.width,
        padding: EdgeInsets.all(SpacingTheme.SPACING_8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SpacingTheme.SPACING_5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(ConstPath.DIALOG_ILLUSTRATION_UNAUTHORIZE_PATH),
            SizedBox(height: SpacingTheme.SPACING_8),
            Text(
              "Masuk Dulu untuk Lanjut",
              style: TextStyleTheme.BODY_2.copyWith(
                color: ColorTheme.TEXT_100,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            Text(
              "Untuk menggunakan fitur ini, kamu perlu masuk ke akunmu atau daftarkan akun terlebih dahulu.",
              style: TextStyleTheme.PARAGRAPH_5.copyWith(
                color: ColorTheme.TEXT_100,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      foregroundColor: ColorTheme.NEUTRAL_100,
                      backgroundColor: ColorTheme.CRIMSON_500,
                    ),
                    child: Text(
                      "Masuk",
                      style: TextStyleTheme.LABEL_1.copyWith(
                        color: ColorTheme.NEUTRAL_100,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SpacingTheme.SPACING_4),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10000),
                      ),
    
                      foregroundColor: Theme.of(
                        context,
                      ).colorScheme.primary,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

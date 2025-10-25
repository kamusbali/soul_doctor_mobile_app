import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

class BasicDialog extends StatelessWidget {
  const BasicDialog({
    super.key,
    required this.title,
    required this.body,
    this.imagePath,
    this.primaryButtonText,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.secondaryButtonText,
  });

  final String title;
  final String body;
  final String? imagePath;
  final String? primaryButtonText;
  final void Function()? onPrimaryPressed;
  final void Function()? onSecondaryPressed;
  final String? secondaryButtonText;

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
            if (imagePath != null) Image.asset(imagePath!),
            SizedBox(height: SpacingTheme.SPACING_8),
            Text(
              title,
              style: TextStyleTheme.BODY_2.copyWith(color: ColorTheme.TEXT_100),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            Text(
              body,
              style: TextStyleTheme.PARAGRAPH_5.copyWith(
                color: ColorTheme.TEXT_100,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            Row(
              spacing: SpacingTheme.SPACING_4,
              children: [
                if (primaryButtonText != null)
                  Expanded(
                    child: FilledButton(
                      onPressed: onPrimaryPressed,
                      style: FilledButton.styleFrom(
                        foregroundColor: ColorTheme.NEUTRAL_100,
                        backgroundColor: ColorTheme.CRIMSON_500,
                      ),
                      child: Text(
                        primaryButtonText!,
                        style: TextStyleTheme.LABEL_1.copyWith(
                          color: ColorTheme.NEUTRAL_100,
                        ),
                      ),
                    ),
                  ),
                if (secondaryButtonText != null)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onSecondaryPressed,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10000),
                        ),

                        foregroundColor: Theme.of(context).colorScheme.primary,
                        side: BorderSide(
                          width: 2,
                          color: ColorTheme.CRIMSON_500,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: Text(
                        secondaryButtonText!,
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

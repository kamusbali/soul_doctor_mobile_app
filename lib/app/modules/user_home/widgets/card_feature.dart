import 'package:flutter/material.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';

class CardFeature extends StatelessWidget {
  const CardFeature({
    super.key,
    required this.title,
    required this.body,
    required this.imageAssetPath,
    required this.backgroundColor,
    this.foregroundColor,
    this.onTap,
  });

  final String title;
  final String body;
  final String imageAssetPath;
  final Color backgroundColor;
  final Color? foregroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(SpacingTheme.SPACING_10),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(SpacingTheme.SPACING_8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SpacingTheme.SPACING_3,
                children: [
                  Text(
                    title,
                    style: TextStyleTheme.BODY_2.copyWith(
                      color: foregroundColor ?? ColorTheme.NEUTRAL_100,
                    ),
                  ),
                  Text(
                    body,
                    style: TextStyleTheme.PARAGRAPH_5.copyWith(
                      color: foregroundColor ?? ColorTheme.NEUTRAL_100,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -10,
              left: 16,
              right: 8,
              child: Image.asset(imageAssetPath),
            ),
          ],
        ),
      ),
    );
  }
}

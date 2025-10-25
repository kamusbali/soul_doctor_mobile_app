import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/color_theme.dart';
import '../../core/theme/spacing_theme.dart';
import '../../core/theme/text_style_theme.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(
          horizontal: SpacingTheme.SPACING_8,
          vertical: SpacingTheme.SPACING_7,
        ),
        decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
        child: Row(
          children: [
            Icon(icon, color: ColorTheme.CRIMSON_500),
            SizedBox(width: SpacingTheme.SPACING_8),
            Expanded(
              child: Text(
                title,
                style: TextStyleTheme.LABEL_3.copyWith(
                  color: ColorTheme.TEXT_100,
                ),
              ),
            ),
            if (onTap != null)
              Icon(
                Amicons.flaticon_angle_small_right_rounded,
                color: ColorTheme.NEUTRAL_700,
              ),
          ],
        ),
      ),
    );
  }
}

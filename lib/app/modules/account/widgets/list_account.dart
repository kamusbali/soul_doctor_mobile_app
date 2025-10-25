import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

class ListAccount extends StatelessWidget {
  const ListAccount({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
          Icon(
            Amicons.flaticon_angle_small_right_rounded,
            color: ColorTheme.NEUTRAL_700,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

class ChipRole extends StatelessWidget {
  const ChipRole({super.key, required this.role});

  final Role role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SpacingTheme.SPACING_6,
        vertical: SpacingTheme.SPACING_2,
      ),
      decoration: BoxDecoration(
        color: ColorTheme.CRIMSON_500,
        borderRadius: BorderRadius.circular(SpacingTheme.SPACING_11),
      ),
      child: Text(
        role.name,
        style: TextStyleTheme.LABEL_4.copyWith(color: ColorTheme.NEUTRAL_100),
      ),
    );
  }
}

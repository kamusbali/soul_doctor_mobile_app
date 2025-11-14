import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/widgets/item/item_information.dart';

import '../../core/theme/color_theme.dart';
import '../../core/theme/spacing_theme.dart';
import '../../core/theme/text_style_theme.dart';

class CardFullInformation extends StatelessWidget {
  const CardFullInformation({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<ItemInformation> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(SpacingTheme.SPACING_8),
      decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: ColorTheme.CRIMSON_500),
              SizedBox(width: SpacingTheme.SPACING_4),
              Expanded(child: Text(title, style: TextStyleTheme.BODY_2)),
            ],
          ),
          Divider(color: ColorTheme.NEUTRAL_500),
          Padding(
            padding: EdgeInsets.only(
              top: SpacingTheme.SPACING_6,
              bottom: SpacingTheme.SPACING_3,
            ),
            child: Column(spacing: SpacingTheme.SPACING_6, children: items),
          ),
        ],
      ),
    );
  }
}

import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/chip/chip_tag_consultation.dart';
import 'package:soul_doctor/app/widgets/chip/chip_tag_consultation_item.dart';

class CardConsultation extends StatelessWidget {
  const CardConsultation({
    super.key,
    this.title,
    required this.body,
    required this.color,
    this.chips,
    this.onTap,
    this.subTitle,
    this.overline,
  });

  final String? title;
  final String? subTitle;
  final String? overline;
  final String body;
  final Color color;
  final List<ChipTagConsultationItem>? chips;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SpacingTheme.SPACING_8,
          vertical: SpacingTheme.SPACING_6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color, Colors.white]),
          border: Border.all(color: ColorTheme.NEUTRAL_500),
          borderRadius: BorderRadius.circular(SpacingTheme.SPACING_5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SpacingTheme.SPACING_3,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: TextStyleTheme.BODY_2.copyWith(
                        color: ColorTheme.TEXT_100,
                      ),
                    ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: TextStyleTheme.PARAGRAPH_4.copyWith(
                        color: ColorTheme.TEXT_100,
                      ),
                    ),
                  if (overline != null)
                    Text(
                      overline!,
                      style: TextStyleTheme.PARAGRAPH_6.copyWith(
                        color: ColorTheme.TEXT_PLACEHOLDER,
                      ),
                    ),
                  Text(
                    body,
                    style: TextStyleTheme.PARAGRAPH_5.copyWith(
                      color: ColorTheme.TEXT_200,
                    ),
                  ),
                  if (chips != null && chips!.isNotEmpty)
                    Row(
                      spacing: SpacingTheme.SPACING_4,
                      children: chips!
                          .map((element) => ChipTagConsultation(data: element))
                          .toList(),
                    ),
                ],
              ),
            ),
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

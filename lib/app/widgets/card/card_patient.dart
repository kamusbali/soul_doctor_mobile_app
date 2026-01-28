import 'package:amicons/amicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:soul_doctor/app/common/constant/dummy.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/avatar/circle_photo_profile.dart';
import 'package:soul_doctor/app/widgets/chip/chip_tag_consultation.dart';
import 'package:soul_doctor/app/widgets/chip/chip_tag_consultation_item.dart';

class CardPatient extends StatelessWidget {
  const CardPatient({
    super.key,
    required this.name,
    required this.age,
    required this.onTap,
  });

  final String name;
  final int age;
  final void Function() onTap;

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
          color: Colors.white,
          border: Border.all(color: ColorTheme.NEUTRAL_500),
          borderRadius: BorderRadius.circular(SpacingTheme.SPACING_5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CirclePhotoProfile(
                        image: AssetImage(Dummy.photoProfile()),
                        width: 50,
                      ),
                      SizedBox(width: SpacingTheme.SPACING_4),
                      Expanded(
                        child: AutoSizeText(
                          name,
                          style: TextStyleTheme.BODY_2,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SpacingTheme.SPACING_4),
                  Row(
                    spacing: SpacingTheme.SPACING_4,
                    children: [
                      ChipTag(
                        data: ChipTagItem(
                          title: "$age Tahun",
                          isChecked: false,
                        ),
                      ),
                      ChipTag(
                        data: ChipTagItem(title: "Laki-Laki", isChecked: false),
                      ),
                    ],
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

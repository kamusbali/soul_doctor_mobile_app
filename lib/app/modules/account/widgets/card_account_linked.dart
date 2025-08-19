import 'package:flutter/material.dart';
import 'package:soul_doctor/app/common/constant/dummy.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/avatar/circle_photo_profile.dart';

class CardAccountLinked extends StatelessWidget {
  const CardAccountLinked({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CirclePhotoProfile(
            image: NetworkImage(Dummy.photoProfile()),
            height: 64,
            width: 64,
          ),
          SizedBox(height: SpacingTheme.SPACING_4),
          Text(
            "Anak Agung Sagung Sari Dewi Lestari",
            style: TextStyleTheme.LABEL_4.copyWith(color: ColorTheme.TEXT_100),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

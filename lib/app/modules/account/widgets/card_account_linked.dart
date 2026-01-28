import 'package:amicons/amicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:soul_doctor/app/common/constant/dummy.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/avatar/circle_photo_profile.dart';

class CardAccountLinked extends StatelessWidget {
  const CardAccountLinked({
    super.key,
    this.isAddCard = false,
    this.onTap,
    required this.title,
  });

  final bool isAddCard;
  final void Function()? onTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isAddCard
                ? Container(
                    height: 64,
                    width: 64,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorTheme.CRIMSON_200,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Amicons.flaticon_user_add_rounded_fill,
                      color: ColorTheme.CRIMSON_500,
                    ),
                  )
                : CirclePhotoProfile(
                    image: AssetImage(Dummy.photoProfile()),
                    height: 64,
                    width: 64,
                  ),
            SizedBox(height: SpacingTheme.SPACING_4),
            AutoSizeText(
              title,
              style: TextStyleTheme.LABEL_4.copyWith(
                color: isAddCard ? ColorTheme.CRIMSON_500 : ColorTheme.TEXT_100,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

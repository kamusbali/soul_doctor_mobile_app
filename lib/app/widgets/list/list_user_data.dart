import 'package:flutter/material.dart';
import 'package:soul_doctor/app/domain/model/user_data.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/avatar/circle_photo_profile.dart';
import 'package:soul_doctor/app/widgets/chip/chip_role.dart';

class ListUserData extends StatelessWidget {
  const ListUserData({super.key, required this.user});

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SpacingTheme.SPACING_4),
        Row(
          children: [
            CirclePhotoProfile(
              image: NetworkImage(user.image),
              height: 64,
              width: 64,
            ),
            SizedBox(width: SpacingTheme.SPACING_4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hai, ${user.name}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleTheme.BODY_2.copyWith(
                      color: ColorTheme.TEXT_100,
                    ),
                  ),
                  SizedBox(height: SpacingTheme.SPACING_3),
                  ChipRole(role: user.role),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: SpacingTheme.SPACING_4),
      ],
    );
  }
}

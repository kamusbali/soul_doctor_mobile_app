import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/domain/model/compact_user.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';
import 'package:soul_doctor/app/widgets/list/list_user_data.dart';

class BasicHeader extends StatelessWidget {
  const BasicHeader({super.key, required this.onTapNotification, this.user});

  final SessionData? user;
  final void Function() onTapNotification;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ConstPath.BACKGROUND_HEADER_PATH,
          width: Get.width,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: SpacingTheme.SPACING_8,
            right: SpacingTheme.SPACING_8,
            top: 80,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(ConstPath.ICON_APP_PATH, height: 28),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      onTapNotification();
                    },
                    icon: Icon(
                      Amicons.flaticon_bell_rounded,
                      color: ColorTheme.CRIMSON_500,
                    ),
                  ),
                ],
              ),

              user != null
                  ? ListUserData(user: user!)
                  : Column(
                      children: [
                        SizedBox(height: SpacingTheme.SPACING_8),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            "Hai,",
                            style: TextStyleTheme.BODY_2.copyWith(
                              color: ColorTheme.TEXT_100,
                            ),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_2),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            "Selamat Datang",
                            style: TextStyleTheme.BODY_2.copyWith(
                              color: ColorTheme.TEXT_100,
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

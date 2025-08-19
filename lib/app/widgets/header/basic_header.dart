import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/domain/model/user_data.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/list/list_user_data.dart';

class BasicHeader extends StatelessWidget implements PreferredSizeWidget {
  const BasicHeader({super.key, required this.onTapNotification, this.user});

  final UserData? user;
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
            top: SpacingTheme.SPACING_8,
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
                  ? ListUserData()
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

  @override
  Size get preferredSize => Size.fromHeight(150);
}

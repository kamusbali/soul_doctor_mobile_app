import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: TextStyleTheme.BODY_2.copyWith(color: ColorTheme.TEXT_100),
            )
          : null,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Navigator.of(context).canPop()
          ? IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Amicons.flaticon_arrow_left_rounded,
                color: ColorTheme.NEUTRAL_900,
              ),
            )
          : null,
      automaticallyImplyLeading: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}

import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/modules/account/widgets/accordion_account_linked.dart';
import 'package:soul_doctor/app/modules/account/widgets/card_account_authentication.dart';
import 'package:soul_doctor/app/modules/account/widgets/list_account.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/widgets/list/list_user_data.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            !controller.isAuth
                ? CardAccountAuthentication()
                : Container(
                    padding: EdgeInsets.only(
                      left: SpacingTheme.SPACING_8,
                      right: SpacingTheme.SPACING_8,
                      top: 80,
                    ),
                    decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
                    child: Column(
                      children: [
                        ListUserData(),
                        SizedBox(height: SpacingTheme.SPACING_11),
                        AccordionAccountLinked(),
                      ],
                    ),
                  ),
            SizedBox(height: SpacingTheme.SPACING_4),
            Container(
              width: Get.width,
              padding: EdgeInsets.all(SpacingTheme.SPACING_8),
              decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
              child: Column(
                children: [
                  if (controller.isAuth)
                    Column(
                      children: [
                        ListAccount(
                          icon: Amicons.flaticon_user_rounded_fill,
                          title: 'Pengaturan Akun',
                          onTap: () {},
                        ),
                        SizedBox(height: SpacingTheme.SPACING_6),
                        Divider(),
                        SizedBox(height: SpacingTheme.SPACING_6),
                      ],
                    ),

                  ListAccount(
                    icon: Amicons.flaticon_document_signed_rounded_fill,
                    title: 'Syarat dan Ketentuan',
                    onTap: () {},
                  ),
                  SizedBox(height: SpacingTheme.SPACING_6),
                  Divider(),
                  SizedBox(height: SpacingTheme.SPACING_6),
                  ListAccount(
                    icon: Amicons.flaticon_shield_rounded_fill,
                    title: 'Kebijakan Privasi',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            if (controller.isAuth)
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(
                  horizontal: SpacingTheme.SPACING_8,
                  vertical: SpacingTheme.SPACING_7,
                ),
                decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),

                child: ListAccount(
                  icon: Amicons.remix_door_open_fill,
                  title: "Keluar",
                  onTap: () {},
                ),
              ),

            SizedBox(height: SpacingTheme.SPACING_4),

            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                horizontal: SpacingTheme.SPACING_8,
                vertical: SpacingTheme.SPACING_7,
              ),
              alignment: Alignment.center,
              child: Obx(() => Text("Versi. ${controller.version.value}")),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/modules/account/widgets/accordion_account_linked.dart';
import 'package:soul_doctor/app/modules/account/widgets/accordion_account_linked_item.dart';
import 'package:soul_doctor/app/modules/account/widgets/card_account_authentication.dart';
import 'package:soul_doctor/app/modules/account/widgets/list_account.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/widgets/list/list_item.dart';
import 'package:soul_doctor/app/widgets/list/list_user_data.dart';

import '../../../domain/model/role.dart';
import '../../wrapper/controllers/wrapper_controller.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  final WrapperController _wrapperController = Get.find();

  AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder(
          init: _wrapperController,
          initState: (_) {},
          builder: (_) {
            return Column(
              children: [
                _wrapperController.user == null
                    ? CardAccountAuthentication(
                        onLogin: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        onRegister: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                      )
                    : Container(
                        padding: EdgeInsets.only(
                          left: SpacingTheme.SPACING_8,
                          right: SpacingTheme.SPACING_8,
                          top: 80,
                        ),
                        decoration: BoxDecoration(
                          color: ColorTheme.NEUTRAL_100,
                        ),
                        child: Column(
                          children: [
                            ListUserData(user: _wrapperController.user!),
                            if (_wrapperController.user?.role == Role.patient &&
                                _wrapperController.user?.caregiver != null) ...[
                              AccordionAccountLinked(
                                isPatient: true,
                                items: [
                                  AccordionAccountLinkedItem(
                                    title: _wrapperController
                                        .user!
                                        .caregiver!
                                        .name,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                            if (_wrapperController.user?.role ==
                                    Role.caregiver &&
                                _wrapperController.user?.patients != null &&
                                _wrapperController
                                    .user!
                                    .patients!
                                    .isNotEmpty) ...[
                              AccordionAccountLinked(
                                items:
                                    _wrapperController.user!.patients
                                        ?.map(
                                          (element) =>
                                              AccordionAccountLinkedItem(
                                                title: element.name,
                                                onTap: () {},
                                              ),
                                        )
                                        .toList() ??
                                    [],
                              ),
                            ],
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
                      if (_wrapperController.user != null)
                        Column(
                          children: [
                            ListAccount(
                              icon: Amicons.flaticon_user_rounded_fill,
                              title: 'Pengaturan Akun',
                              onTap: () {
                                Get.toNamed(Routes.ACCOUNT_SETTING);
                              },
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
                if (_wrapperController.user != null)
                  ListItem(
                    icon: Amicons.remix_door_open_fill,
                    title: "Keluar",
                    onTap: () {},
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
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/common/constant/dummy.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/domain/model/user_data.dart';
import 'package:soul_doctor/app/widgets/placeholder/placeholder_no_consultation.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/dialog/unauthorized_dialog.dart';
import 'package:soul_doctor/app/widgets/header/basic_header.dart';

import '../controllers/user_home_controller.dart';
import '../widgets/card_feature.dart';

class UserHomeView extends GetView<UserHomeController> {
  const UserHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicHeader(
        user: UserData(
          name: "Anak Agung Ngurah Putra Tole Armstrong",
          role: Role.caregiver,
          image: Dummy.photoProfile(),
        ),
        onTapNotification: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: Text(
                  "Fitur Unggulan",
                  style: TextStyleTheme.BODY_2.copyWith(
                    color: ColorTheme.TEXT_100,
                  ),
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardFeature(
                      title: 'Periksa Kondisi Mental',
                      body:
                          'Deteksi tanda-tanda gangguan mental hanya dengan menjawab beberapa pertanyaan.',
                      imageAssetPath: ConstPath
                          .CARD_ILLUSTRATION_CHECK_MENTAL_CONDITION_PATH,
                      backgroundColor: ColorTheme.COBALT_400,
                      onTap: () {
                        Get.toNamed(Routes.ASSESSMENT_QUESTION);
                      },
                    ),
                    SizedBox(width: SpacingTheme.SPACING_4),
                    CardFeature(
                      title: 'Ajukan Konsultasi',
                      body:
                          'Minta bantuan tenaga medis  jika Anda memiliki keluhan lebih lanjut.',
                      imageAssetPath:
                          ConstPath.CARD_ILLUSTRATION_CONSULTATION_PATH,
                      backgroundColor: ColorTheme.EUCALYPTUS_500,
                      onTap: () {
                        Get.dialog(UnauthorizedDialog());
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_11),
              SizedBox(
                width: Get.width,
                child: Text(
                  "Konsultasi Mendatang",
                  style: TextStyleTheme.BODY_2.copyWith(
                    color: ColorTheme.TEXT_100,
                  ),
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_8),
              PlaceholderNoConsultation(),
            ],
          ),
        ),
      ),
    );
  }
}

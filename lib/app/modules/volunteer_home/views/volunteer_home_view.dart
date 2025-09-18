import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/widgets/card/card_consultation.dart';
import 'package:soul_doctor/app/widgets/chip/chip_tag_consultation_item.dart';

import '../../../common/constant/dummy.dart';
import '../../../domain/model/role.dart';
import '../../../domain/model/user_data.dart';
import '../../../utils/theme/color_theme.dart';
import '../../../utils/theme/spacing_theme.dart';
import '../../../utils/theme/text_style_theme.dart';
import '../../../widgets/header/basic_header.dart';
import '../controllers/volunteer_home_controller.dart';

class VolunteerHomeView extends GetView<VolunteerHomeController> {
  const VolunteerHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicHeader(
        user: UserData(
          name: "Anak Agung Ngurah Putra Tole Armstrong",
          role: Role.volunteer,
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
                  "Visit Mendatang",
                  style: TextStyleTheme.BODY_2.copyWith(
                    color: ColorTheme.TEXT_100,
                  ),
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_4),
              CardConsultation(
                title: "26 April 2025",
                subTitle: "I Putu",
                overline: "Jl. Catur No. 3",
                body:
                    "Cemas berlebihan / Kesulitan tidur / Stres  karena pekerjaan",
                color: ColorTheme.COBALT_200,
                chips: [
                  ChipTagConsultationItem(title: "69 Tahun", isChecked: false),
                  ChipTagConsultationItem(title: "Laki-Laki", isChecked: false),
                  ChipTagConsultationItem(title: "Diasuh", isChecked: false),
                ],
              ),
              SizedBox(height: SpacingTheme.SPACING_11),
              SizedBox(
                width: Get.width,
                child: Text(
                  "Permintaan Visit",
                  style: TextStyleTheme.BODY_2.copyWith(
                    color: ColorTheme.TEXT_100,
                  ),
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_4),
              CardConsultation(
                title: "19 Mei 2025",
                subTitle: "I Wayan",
                overline: "Jl. Mawar No. 10",
                body:
                    "Cemas berlebihan / Kesulitan tidur / Stres  karena pekerjaan",
                color: ColorTheme.GAMBOGE_200,
                chips: [
                  ChipTagConsultationItem(title: "27 Tahun", isChecked: false),
                  ChipTagConsultationItem(title: "Laki-Laki", isChecked: false),
                  ChipTagConsultationItem(title: "Diasuh", isChecked: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

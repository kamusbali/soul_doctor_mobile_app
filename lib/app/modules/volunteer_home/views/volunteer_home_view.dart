import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
import 'package:soul_doctor/app/widgets/card/card_add_consultation.dart';
import 'package:soul_doctor/app/widgets/card/card_consultation.dart';
import 'package:soul_doctor/app/widgets/chip/chip_tag_consultation_item.dart';

import '../../../common/resource.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../widgets/header/basic_header.dart';
import '../../../widgets/loading/loading_view.dart';
import '../controllers/volunteer_home_controller.dart';

class VolunteerHomeView extends GetView<VolunteerHomeController> {
  VolunteerHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Obx(() {
          switch (controller.wrapperController.user.value.status) {
            case Status.loading:
              return LoadingView();
            default:
              return BasicHeader(
                user: controller.wrapperController.user.value.data,
                onTapNotification: () {},
              );
          }
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingTheme.SPACING_8,
            vertical: SpacingTheme.SPACING_11,
          ),
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
              SizedBox(height: SpacingTheme.SPACING_4),
              CardAddConsultation(
                onTap: () {
                  Get.toNamed(Routes.ADD_VISIT_REQUEST);
                },
              ),
              SizedBox(height: SpacingTheme.SPACING_11),

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
                onTap: () {
                  Get.toNamed(Routes.VISIT_DETAIL);
                },
                title: "26 April 2025",
                subTitle: "I Putu",
                overline: "Jl. Catur No. 3",
                body:
                    "Cemas berlebihan / Kesulitan tidur / Stres  karena pekerjaan",
                color: ColorTheme.COBALT_200,
                chips: [
                  ChipTagItem(title: "69 Tahun", isChecked: false),
                  ChipTagItem(title: "Laki-Laki", isChecked: false),
                  ChipTagItem(title: "Diasuh", isChecked: false),
                ],
              ),
              SizedBox(height: SpacingTheme.SPACING_4),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(side: BorderSide.none),
                child: Center(
                  child: Text("Lihat Semua", style: TextStyleTheme.LABEL_1),
                ),
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
                onTap: () {
                  Get.toNamed(Routes.VISIT_DETAIL);
                },
                title: "19 Mei 2025",
                subTitle: "I Wayan",
                overline: "Jl. Mawar No. 10",
                body:
                    "Cemas berlebihan / Kesulitan tidur / Stres  karena pekerjaan",
                color: ColorTheme.GAMBOGE_200,
                chips: [
                  ChipTagItem(title: "27 Tahun", isChecked: false),
                  ChipTagItem(title: "Laki-Laki", isChecked: false),
                  ChipTagItem(title: "Diasuh", isChecked: false),
                ],
              ),
              SizedBox(height: SpacingTheme.SPACING_4),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(side: BorderSide.none),
                child: Center(
                  child: Text("Lihat Semua", style: TextStyleTheme.LABEL_1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

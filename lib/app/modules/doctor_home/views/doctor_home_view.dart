import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../widgets/card/card_add_consultation.dart';
import '../../../widgets/card/card_consultation.dart';
import '../../../widgets/chip/chip_tag_consultation_item.dart';
import '../../../widgets/header/basic_header.dart';
import '../../wrapper/controllers/wrapper_controller.dart';
import '../controllers/doctor_home_controller.dart';

class DoctorHomeView extends GetView<DoctorHomeController> {
  final WrapperController _wrapperController = Get.find();

  DoctorHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: GetBuilder<WrapperController>(
          init: _wrapperController,
          initState: (_) {},
          builder: (_) {
            return BasicHeader(
              user: _wrapperController.user,
              onTapNotification: () {},
            );
          },
        ),
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
                  "Konsultasi Terbaru",
                  style: TextStyleTheme.BODY_2.copyWith(
                    color: ColorTheme.TEXT_100,
                  ),
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_4),
              CardConsultation(
                title: "I Putu",

                body: "Perasaan hampa dan kehilangan semangat",
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
                  child: Text(
                    "Lihat Semua Konsultasi",
                    style: TextStyleTheme.LABEL_1,
                  ),
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_11),
            ],
          ),
        ),
      ),
    );
  }
}

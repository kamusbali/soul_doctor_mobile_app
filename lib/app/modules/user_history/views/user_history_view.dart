import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/card/card_consultation.dart';
import 'package:soul_doctor/app/widgets/chip/chip_tag_consultation_item.dart';

import '../controllers/user_history_controller.dart';

class UserHistoryView extends GetView<UserHistoryController> {
  const UserHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.SURFACE,
        elevation: 0,
        title: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SpacingTheme.SPACING_5),
              borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SpacingTheme.SPACING_5),
              borderSide: const BorderSide(color: ColorTheme.NEUTRAL_500),
            ),
            isDense: true,
            prefixIcon: Icon(Amicons.flaticon_search_rounded),
            hintText: "Cari",
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingTheme.SPACING_4,
            ),
            child: IconButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    width: Get.width,
                    height: 700,
                    padding: EdgeInsets.only(
                      left: SpacingTheme.SPACING_8,
                      right: SpacingTheme.SPACING_8,
                      top: SpacingTheme.SPACING_8,
                      bottom: SpacingTheme.SPACING_13,
                    ),
                    decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 6,
                          decoration: BoxDecoration(
                            color: ColorTheme.NEUTRAL_500,
                            borderRadius: BorderRadius.circular(10000),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            "Filter",
                            style: TextStyleTheme.BODY_1.copyWith(
                              color: ColorTheme.TEXT_100,
                            ),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_6),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Konsultasi Terdahulu",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.CRIMSON_500,
                                    ),
                                  ),
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Konsultasi Mendatang",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.CRIMSON_500,
                                    ),
                                  ),
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Sedang Konsultasi",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.CRIMSON_500,
                                    ),
                                  ),
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Dapat Obat",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.TEXT_PLACEHOLDER,
                                    ),
                                  ),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Melakukan Terapi",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.TEXT_PLACEHOLDER,
                                    ),
                                  ),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Visit",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.TEXT_PLACEHOLDER,
                                    ),
                                  ),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_6),
                        SizedBox(
                          width: Get.width,
                          child: FilledButton(
                            onPressed: () {},
                            child: Text(
                              "Terapkan",
                              style: TextStyleTheme.LABEL_1.copyWith(
                                color: ColorTheme.NEUTRAL_100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(
                Amicons.flaticon_filter_rounded,
                color: ColorTheme.CRIMSON_500,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: Text(
                  "Menunggu Jadwal",
                  style: TextStyleTheme.BODY_2.copyWith(
                    color: ColorTheme.TEXT_100,
                  ),
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_4),
              Column(
                spacing: SpacingTheme.SPACING_4,
                children: [
                  CardConsultation(
                    body: "Kesulitan tidur dan stres kerja",
                    color: ColorTheme.GAMBOGE_200,
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_CONSULTATION);
                    },
                  ),
                ],
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
              SizedBox(height: SpacingTheme.SPACING_4),
              Column(
                spacing: SpacingTheme.SPACING_4,
                children: [
                  CardConsultation(
                    title: "28 April 2025",
                    body: "Kesulitan tidur dan stres kerja",
                    color: ColorTheme.COBALT_200,
                  ),
                  CardConsultation(
                    title: "28 April 2025",
                    body: "Kesulitan tidur dan stres kerja",
                    color: ColorTheme.COBALT_200,
                  ),
                ],
              ),
              SizedBox(height: SpacingTheme.SPACING_11),
              SizedBox(
                width: Get.width,
                child: Text(
                  "Konsultasi Terdahulu",
                  style: TextStyleTheme.BODY_2.copyWith(
                    color: ColorTheme.TEXT_100,
                  ),
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_4),
              Column(
                spacing: SpacingTheme.SPACING_4,
                children: [
                  CardConsultation(
                    title: "26 April 2025",
                    body:
                        "Cemas berlebihan / Kesulitan tidur / Stres  karena pekerjaan",
                    color: ColorTheme.EUCALYPTUS_200,
                    chips: [
                      ChipTagConsultationItem(title: "Obat", isChecked: true),
                      ChipTagConsultationItem(title: "Terapi", isChecked: true),
                      ChipTagConsultationItem(title: "Visit", isChecked: true),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

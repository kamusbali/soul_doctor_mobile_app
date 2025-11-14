import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/widgets/card/card_consultation.dart'
    show CardConsultation;

import '../../../common/resource.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../domain/model/gender.dart';
import '../../../domain/model/role.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/chip/chip_tag_consultation_item.dart';
import '../../../widgets/placeholder/placeholder_no_consultation.dart';
import '../controllers/consultation_controller.dart';

class ConsultationView extends GetView<ConsultationController> {
  const ConsultationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 150),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: SpacingTheme.SPACING_6,
                  children: Role.doctor.status.asMap().entries.map((element) {
                    var key = element.key;
                    var value = element.value;
                    return Obx(
                      () => InkWell(
                        onTap: () {
                          controller.changeIndexTab(key, value);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: SpacingTheme.SPACING_4,
                            horizontal: SpacingTheme.SPACING_11,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorTheme.CRIMSON_500),
                            color: controller.selectedIndex.value == key
                                ? ColorTheme.CRIMSON_200
                                : ColorTheme.NEUTRAL_100,
                            borderRadius: BorderRadius.circular(
                              SpacingTheme.SPACING_4,
                            ),
                          ),
                          child: Text(
                            value.getName(Role.doctor),
                            style: TextStyleTheme.LABEL_1.copyWith(
                              color: ColorTheme.CRIMSON_500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.searchController,
                      onFieldSubmitted: (value) {
                        controller.getConsultation();
                        controller.onClearSearchText();
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            SpacingTheme.SPACING_5,
                          ),
                          borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            SpacingTheme.SPACING_5,
                          ),
                          borderSide: const BorderSide(
                            color: ColorTheme.NEUTRAL_500,
                          ),
                        ),
                        isDense: true,
                        prefixIcon: Icon(Amicons.flaticon_search_rounded),
                        hintText: "Cari",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.only(
                            left: SpacingTheme.SPACING_8,
                            right: SpacingTheme.SPACING_8,
                            top: SpacingTheme.SPACING_8,
                            bottom: SpacingTheme.SPACING_13,
                          ),
                          decoration: BoxDecoration(
                            color: ColorTheme.NEUTRAL_100,
                          ),
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
                              Obx(
                                () => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CheckboxListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text(
                                        "> 50 Tahun",
                                        style: TextStyleTheme.LABEL_1.copyWith(
                                          color: ColorTheme.TEXT_PLACEHOLDER,
                                        ),
                                      ),
                                      value: controller
                                          .isAgeGreaterThan50Temp
                                          .value,
                                      onChanged:
                                          controller.onChangeIsMedicationTemp,
                                    ),
                                    CheckboxListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text(
                                        "Konsultasi Pertama",
                                        style: TextStyleTheme.LABEL_1.copyWith(
                                          color: ColorTheme.TEXT_PLACEHOLDER,
                                        ),
                                      ),
                                      value: controller
                                          .isFirstConsultationTemp
                                          .value,
                                      onChanged:
                                          controller.onChangeIsTherapyTemp,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              SizedBox(
                                width: Get.width,
                                child: FilledButton(
                                  onPressed: controller.onConfirmFilter,
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
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingTheme.SPACING_8,
            vertical: SpacingTheme.SPACING_11,
          ),
          child: Obx(() {
            switch (controller.consultation.value.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.success:
                return Column(
                  spacing: 8,
                  children: controller.consultation.value.data!.data
                      .map(
                        (e) => CardConsultation(
                          onTap: () {
                            Get.toNamed(
                              Routes.CONSULTATION_REQUEST_DETAIL,
                              arguments: e.id,
                            );
                          },
                          title: e.name,
                          body: e.description,
                          color: e.state.getColor(Role.patient),
                          chips: [
                            ChipTagItem(
                              title: "${e.patientSummary.age} tahun",
                              isChecked: false,
                            ),
                            ChipTagItem(
                              title: Gender.getGenderByValue(
                                e.patientSummary.gender,
                              ).name,
                              isChecked: false,
                            ),
                            if (e.patientSummary.hasCaregiver)
                              ChipTagItem(title: "Diasuh", isChecked: false),
                          ],
                        ),
                      )
                      .toList(),
                );
              default:
                return PlaceholderNoConsultation();
            }
          }),
          // child: Column(
          //   children: [
          //     CardConsultation(
          //       onTap: () {
          //       },
          //       title: "I Putu",
          //       body: "Perasaan hampa dan kehilangan semangat",
          //       color: ColorTheme.COBALT_200,
          //       chips: [
          //         ChipTagItem(title: "69 Tahun", isChecked: false),
          //         ChipTagItem(title: "Laki-Laki", isChecked: false),
          //         ChipTagItem(title: "Diasuh", isChecked: false),
          //       ],
          //     ),
          //     SizedBox(height: SpacingTheme.SPACING_4),
          //   ],
          // ),
        ),
      ),
    );
  }
}

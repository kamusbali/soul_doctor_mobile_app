import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

import '../../../helpers/date_time_utils.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/card/card_consultation.dart';
import '../../../widgets/chip/chip_tag_consultation_item.dart';
import '../../../widgets/placeholder/placeholder_no_consultation.dart';
import '../controllers/patient_history_controller.dart';

class PatientHistoryView extends GetView<PatientHistoryController> {
  const PatientHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          Get.width,
          (Get.key.currentState!.canPop())
              ? (MediaQuery.of(context).padding.top + 145)
              : 145,
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 12,
            top: MediaQuery.of(context).padding.top,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (Get.key.currentState!.canPop()) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Amicons.flaticon_arrow_left_rounded,
                        color: ColorTheme.NEUTRAL_900,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SpacingTheme.SPACING_8),
              ],
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: SpacingTheme.SPACING_6,
                  children: Role.patient.status.asMap().entries.map((element) {
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
                            value.getName(Role.patient),
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
                      onFieldSubmitted: (value) {
                        controller.getConsultation();
                        controller.onClearSearchText();
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.onOpenBottomSheet();
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
                                        "Dapat Obat",
                                        style: TextStyleTheme.LABEL_1.copyWith(
                                          color: ColorTheme.TEXT_PLACEHOLDER,
                                        ),
                                      ),
                                      value: controller.isMedicationTemp.value,
                                      onChanged:
                                          controller.onChangeIsMedicationTemp,
                                    ),
                                    CheckboxListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text(
                                        "Melakukan Terapi",
                                        style: TextStyleTheme.LABEL_1.copyWith(
                                          color: ColorTheme.TEXT_PLACEHOLDER,
                                        ),
                                      ),
                                      value: controller.isTherapyTemp.value,
                                      onChanged:
                                          controller.onChangeIsTherapyTemp,
                                    ),
                                    CheckboxListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text(
                                        "Visit",
                                        style: TextStyleTheme.LABEL_1.copyWith(
                                          color: ColorTheme.TEXT_PLACEHOLDER,
                                        ),
                                      ),
                                      value: controller.isVisitTemp.value,
                                      onChanged: controller.onChangeIsVisitTemp,
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
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Obx(() {
          switch (controller.consultation.value.status) {
            case Status.loading:
              return Center(child: CircularProgressIndicator());
            case Status.success:
              // return PagingListener<int, Consultation>(
              //   controller:
              //       controller.pagingController
              //           as PagingController<int, Consultation>,
              //   builder: (context, state, fetchNextPage) =>
              //       PagedListView<int, Consultation>(
              //         state: state,
              //         fetchNextPage: fetchNextPage,
              //         builderDelegate: PagedChildBuilderDelegate(
              //           itemBuilder: (context, item, index) => CardConsultation(
              //             onTap: () {
              //               Get.toNamed(
              //                 Routes.DETAIL_CONSULTATION,
              //                 arguments: item.id,
              //               );
              //             },
              //             title: item.visitDate != null
              //                 ? DateTimeUtils.dateToDayMonthYear(
              //                     item.visitDate!,
              //                   )
              //                 : item.state.getName(Role.patient),
              //             body: item.description,
              //             color: item.state.getColor(Role.patient),
              //             chips: [
              //               if (item.medicationSummary.medication)
              //                 ChipTagItem(title: "Obat", isChecked: true),
              //               if (item.medicationSummary.therapy)
              //                 ChipTagItem(title: "Terapi", isChecked: true),
              //               if (item.medicationSummary.visit)
              //                 ChipTagItem(title: "Visit", isChecked: true),
              //             ],
              //           ),
              //         ),
              //       ),
              // );
              return LayoutBuilder(
                builder: (context, constraints) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      controller.onInit();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          spacing: 8,
                          children: controller.consultation.value.data!.data
                              .map(
                                (e) => CardConsultation(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.DETAIL_CONSULTATION,
                                      arguments: e.id,
                                    );
                                  },
                                  title: e.visitDate != null
                                      ? DateTimeUtils.dateToDayMonthYear(
                                          e.visitDate!,
                                        )
                                      : e.state.getName(Role.patient),
                                  body: e.description,
                                  color: e.state.getColor(Role.patient),
                                  chips: [
                                    if (e.medicationSummary.medication)
                                      ChipTagItem(
                                        title: "Obat",
                                        isChecked: true,
                                      ),
                                    if (e.medicationSummary.therapy)
                                      ChipTagItem(
                                        title: "Terapi",
                                        isChecked: true,
                                      ),
                                    if (e.medicationSummary.visit)
                                      ChipTagItem(
                                        title: "Visit",
                                        isChecked: true,
                                      ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
              );
            default:
              return LayoutBuilder(
                builder: (context, constraints) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      controller.onInit();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          children: [
                            PlaceholderNoData(
                              title: "Belum ada jadwal konsultasi",
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        }),
      ),
    );
  }
}

import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/resource.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../domain/model/role.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/card/card_patient.dart';
import '../../../widgets/placeholder/placeholder_no_consultation.dart';
import '../../add_edit_reminder_care_task/settings/add_edit_reminder_care_task_settings.dart';
import '../../reminder_care_task/settings/reminder_care_task_settings.dart';
import '../controllers/reminder_care_task_list_patient_controller.dart';

class ReminderCareTaskListPatientView
    extends GetView<ReminderCareTaskListPatientController> {
  const ReminderCareTaskListPatientView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.SURFACE,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Amicons.flaticon_arrow_left_rounded,
            color: ColorTheme.TEXT_100,
          ),
        ),
        title: TextFormField(
          controller: controller.searchController,
          onFieldSubmitted: (value) {
            controller.getPatient();
            controller.onClearSearchText();
          },
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
                        Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckboxListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text(
                                  "Laki-Laki",
                                  style: TextStyleTheme.LABEL_1.copyWith(
                                    color: ColorTheme.TEXT_PLACEHOLDER,
                                  ),
                                ),
                                value: controller.isMaleTemp.value,
                                onChanged: controller.onChangeIsMaleTemp,
                              ),
                              CheckboxListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text(
                                  "Perempuan",
                                  style: TextStyleTheme.LABEL_1.copyWith(
                                    color: ColorTheme.TEXT_PLACEHOLDER,
                                  ),
                                ),
                                value: controller.isFemaleTemp.value,
                                onChanged: controller.onChangeIsFemaleTemp,
                              ),
                              CheckboxListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text(
                                  "Umur > 50 tahun",
                                  style: TextStyleTheme.LABEL_1.copyWith(
                                    color: ColorTheme.TEXT_PLACEHOLDER,
                                  ),
                                ),
                                value: controller.isAgeGreaterThan50Temp.value,
                                onChanged:
                                    controller.onChangeIsAgeGreaterThan50Temp,
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
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        child: Obx(
          () => controller.user.value.data?.role == Role.doctor
              ? FloatingActionButton(
                  onPressed: () {
                    Get.toNamed(
                      Routes.ADD_EDIT_REMINDER_CARE_TASK,
                      arguments: AddEditReminderCareTaskSettings(),
                    );
                  },
                  child: Icon(
                    Amicons.flaticon_plus_rounded,
                    color: ColorTheme.NEUTRAL_100,
                  ),
                )
              : SizedBox.shrink(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingTheme.SPACING_8),
        child: Obx(() {
          switch (controller.patient.value.status) {
            case Status.loading:
              return Center(child: CircularProgressIndicator());
            case Status.success:
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
                          spacing: SpacingTheme.SPACING_4,
                          children:
                              controller.patient.value.data
                                  ?.map(
                                    (e) => CardPatient(
                                      name: e.name,
                                      age: e.summary.age,
                                      role: Role.patient,
                                      onTap: () {
                                        if (controller.user.value.data?.role !=
                                            Role.patient) {
                                          Get.toNamed(
                                            Routes.REMINDER_CARE_TASK,
                                            arguments: ReminderCareTaskSettings(
                                              patientId: e.id,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  )
                                  .toList() ??
                              [],
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
                              title: "Belom ada reminder care task",
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

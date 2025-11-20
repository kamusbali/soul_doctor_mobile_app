import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/helpers/date_time_utils.dart';
import 'package:soul_doctor/app/modules/visit_detail/settings/visit_detail_settings.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
import 'package:soul_doctor/app/widgets/card/card_add_consultation.dart';
import 'package:soul_doctor/app/widgets/card/card_consultation.dart';
import 'package:soul_doctor/app/widgets/chip/chip_tag_consultation_item.dart';
import 'package:soul_doctor/app/widgets/placeholder/placeholder_no_consultation.dart';

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
          switch (controller.user.value.status) {
            case Status.loading:
              return LoadingView();
            default:
              return BasicHeader(
                user: controller.user.value.data,
                onTapNotification: () {},
              );
          }
        }),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
                Obx(() {
                  switch (controller.upcomingVisitState.value.status) {
                    case Status.loading:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      );
                    case Status.success:
                      var data = controller.upcomingVisitState.value.data!;
                      return Column(
                        spacing: SpacingTheme.SPACING_4,
                        children: data
                            .map(
                              (e) => CardConsultation(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.VISIT_DETAIL,
                                    arguments: VisitDetailSettings(
                                      id: e.id,
                                      isFirstVisit:
                                          e.patientSummary.isFirstVisit,
                                    ),
                                  )?.then((_) {
                                    controller.onInit();
                                  });
                                },
                                title: e.visitDate == null
                                    ? null
                                    : DateTimeUtils.dateToDayMonthYear(
                                        e.visitDate!,
                                      ),
                                subTitle: e.name,
                                overline: e.address,
                                body: e.description,
                                color: ColorTheme.COBALT_200,
                                chips: [
                                  if (e.patientSummary.isContinuation)
                                    ChipTagItem(
                                      title: "Lanjutan",
                                      isChecked: false,
                                    ),
                                  ChipTagItem(
                                    title: "${e.patientSummary.age} Tahun",
                                    isChecked: false,
                                  ),
                                  ChipTagItem(
                                    title: e.patientSummary.gender.name,
                                    isChecked: false,
                                  ),
                                  if (e.patientSummary.hasCaregiver)
                                    ChipTagItem(
                                      title: "Diasuh",
                                      isChecked: false,
                                    ),
                                ],
                              ),
                            )
                            .toList(),
                      );
                    default:
                      return PlaceholderNoData(title: "No Data Consultation");
                  }
                }),
                SizedBox(height: SpacingTheme.SPACING_4),
                OutlinedButton(
                  onPressed: () {
                    controller.volunteerWrapperController.onChangeTab(1);
                  },
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
                Obx(() {
                  switch (controller.visitRequestState.value.status) {
                    case Status.loading:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      );
                    case Status.success:
                      var data = controller.visitRequestState.value.data!;
                      return Column(
                        spacing: SpacingTheme.SPACING_4,
                        children: data
                            .map(
                              (e) => CardConsultation(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.VISIT_DETAIL,
                                    arguments: VisitDetailSettings(
                                      id: e.id,
                                      isFirstVisit:
                                          e.patientSummary.isFirstVisit,
                                    ),
                                  )?.then((_) {
                                    controller.onInit();
                                  });
                                },
                                title: e.visitDate == null
                                    ? null
                                    : DateTimeUtils.dateToDayMonthYear(
                                        e.visitDate!,
                                      ),
                                subTitle: e.name,
                                overline: e.address,
                                body: e.description,
                                color: e.state.getColor(Role.volunteer),
                                chips: [
                                  if (e.patientSummary.isContinuation)
                                    ChipTagItem(
                                      title: "Lanjutan",
                                      isChecked: false,
                                    ),
                                  ChipTagItem(
                                    title: "${e.patientSummary.age} Tahun",
                                    isChecked: false,
                                  ),
                                  ChipTagItem(
                                    title: e.patientSummary.gender.name,
                                    isChecked: false,
                                  ),
                                  if (e.patientSummary.hasCaregiver)
                                    ChipTagItem(
                                      title: "Diasuh",
                                      isChecked: false,
                                    ),
                                ],
                              ),
                            )
                            .toList(),
                      );
                    default:
                      return PlaceholderNoData(title: "No Data Consultation");
                  }
                }),

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
      ),
    );
  }
}

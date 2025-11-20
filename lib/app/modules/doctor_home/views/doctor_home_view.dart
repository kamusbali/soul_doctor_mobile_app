import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/modules/consultation_request_detail/settings/consultation_request_detail_settings.dart';

import '../../../common/resource.dart';
import '../../../routes/app_pages.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../widgets/card/card_add_consultation.dart';
import '../../../widgets/card/card_consultation.dart';
import '../../../widgets/chip/chip_tag_consultation_item.dart';
import '../../../widgets/header/basic_header.dart';
import '../../../widgets/loading/loading_view.dart';
import '../../../widgets/placeholder/placeholder_no_consultation.dart';
import '../controllers/doctor_home_controller.dart';

class DoctorHomeView extends GetView<DoctorHomeController> {
  const DoctorHomeView({super.key});
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
                    Get.toNamed(Routes.ADD_VISIT_REQUEST)?.then((_) {
                      controller.onInit();
                    });
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
                Obx(() {
                  switch (controller.consultation.value.status) {
                    case Status.loading:
                      return Center(child: CircularProgressIndicator());
                    case Status.success:
                      return Column(
                        spacing: 8,
                        children: controller.consultation.value.data!
                            .map(
                              (e) => CardConsultation(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.CONSULTATION_REQUEST_DETAIL,
                                    arguments:
                                        ConsultationRequestDetailSettings(
                                          id: e.id,
                                        ),
                                  )?.then((_) {
                                    controller.onInit();
                                  });
                                },
                                title: e.name,
                                body: e.description,
                                color: e.state.getColor(Role.doctor),
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
                      return PlaceholderNoData(
                        title: "Belum ada jadwal konsultasi",
                      );
                  }
                }),
                // CardConsultation(
                //   onTap: () {
                //     Get.toNamed(Routes.CONSULTATION_REQUEST_DETAIL);
                //   },
                //   title: "I Putu",
                //   body: "Perasaan hampa dan kehilangan semangat",
                //   color: ColorTheme.COBALT_200,
                //   chips: [
                //     ChipTagItem(title: "69 Tahun", isChecked: false),
                //     ChipTagItem(title: "Laki-Laki", isChecked: false),
                //     ChipTagItem(title: "Diasuh", isChecked: false),
                //   ],
                // ),
                SizedBox(height: SpacingTheme.SPACING_4),
                OutlinedButton(
                  onPressed: () {
                    controller.doctorWrapperController.onChangeTab(1);
                  },
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/helpers/date_time_utils.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/consultation_request_detail/settings/consultation_request_detail_settings.dart';
import 'package:soul_doctor/app/widgets/card/card_consultation.dart';
import 'package:soul_doctor/app/widgets/chip/chip_tag_consultation_item.dart';
import 'package:soul_doctor/app/widgets/loading/loading_view.dart';
import 'package:soul_doctor/app/widgets/placeholder/placeholder_no_consultation.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/header/basic_header.dart';

import '../controllers/user_home_controller.dart';
import '../widgets/card_feature.dart';

class UserHomeView extends GetView<UserHomeController> {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Obx(() {
          switch (controller.user.value.status) {
            case Status.loading:
              return SafeArea(child: LoadingView());
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
                Row(
                  children: [
                    Expanded(
                      child: CardFeature(
                        title: 'Ajukan Konsultasi',
                        body:
                            'Minta bantuan tenaga medis  jika Anda memiliki keluhan lebih lanjut.',
                        imageAssetPath:
                            ConstPath.CARD_ILLUSTRATION_CONSULTATION_PATH,
                        backgroundColor: ColorTheme.EUCALYPTUS_500,
                        onTap: () {
                          if (controller.user.value.data != null) {
                            if (controller.user.value.data?.role ==
                                Role.patient) {
                              Get.toNamed(Routes.ADD_CONSULTATION)?.then((_) {
                                controller.onInit();
                              });
                              return;
                            } else {
                              Get.toNamed(Routes.ADD_VISIT_REQUEST)?.then((_) {
                                controller.onInit();
                              });
                              return;
                            }
                          }

                          UiFeedbackUtils.showDialog(
                            title: "Masuk Dulu untuk Lanjut",
                            body:
                                "Untuk menggunakan fitur ini, kamu perlu masuk ke akunmu atau daftarkan akun terlebih dahulu.",
                            imagePath:
                                ConstPath.DIALOG_ILLUSTRATION_UNAUTHORIZE_PATH,
                            onPrimaryPressed: () {
                              Get.back();
                              Get.toNamed(Routes.LOGIN);
                            },
                            primaryButtonText: "Masuk",
                            onSecondaryPressed: () {
                              Get.back();
                              Get.toNamed(Routes.REGISTER);
                            },
                            secondaryButtonText: "Daftar",
                          );
                        },
                      ),
                    ),
                    SizedBox(width: SpacingTheme.SPACING_4),
                    Expanded(
                      child: CardFeature(
                        title: 'Periksa Mental',
                        body:
                            'Deteksi gangguan mental hanya dengan menjawab beberapa pertanyaan.',
                        imageAssetPath: ConstPath
                            .CARD_ILLUSTRATION_CHECK_MENTAL_CONDITION_PATH,
                        backgroundColor: ColorTheme.COBALT_400,
                        onTap: () {
                          Get.toNamed(Routes.ASSESSMENT_QUESTION)?.then((_) {
                            controller.onInit();
                          });
                        },
                      ),
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
                SizedBox(height: SpacingTheme.SPACING_8),
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
                                title: e.visitDate != null
                                    ? DateTimeUtils.dateToDayMonthYear(
                                        e.visitDate!,
                                      )
                                    : e.state.getName(
                                        controller.user.value.data?.role,
                                      ),
                                body: e.description,
                                color: e.state.getColor(
                                  controller.user.value.data?.role,
                                ),
                                chips: [
                                  if (e.medicationSummary.medication)
                                    ChipTagItem(title: "Obat", isChecked: true),
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
                      );
                    default:
                      return PlaceholderNoData(
                        title: "Belum ada jadwal konsultasi",
                      );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

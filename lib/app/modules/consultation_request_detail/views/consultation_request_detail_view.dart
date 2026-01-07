import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/consultation_detail.dart';
import 'package:soul_doctor/app/domain/model/consultation_request_data.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/model/consultation_type.dart';
import 'package:soul_doctor/app/domain/model/education.dart';
import 'package:soul_doctor/app/domain/model/gender.dart';
import 'package:soul_doctor/app/domain/model/marital.dart';
import 'package:soul_doctor/app/domain/model/profile.dart';
import 'package:soul_doctor/app/domain/model/religion.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/helpers/date_time_utils.dart';
import 'package:soul_doctor/app/modules/diagnosis_form/settings/diagnosis_form_settings.dart';
import 'package:soul_doctor/app/modules/visit_schedule_form/settings/visit_schedule_form_settings.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../widgets/card/card_expanded_information.dart';
import '../../../widgets/card/card_full_information.dart';
import '../../../widgets/item/item_information.dart';
import '../controllers/consultation_request_detail_controller.dart';

class ConsultationRequestDetailView
    extends GetView<ConsultationRequestDetailController> {
  const ConsultationRequestDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Permintaan',
          style: TextStyleTheme.BODY_2.copyWith(color: ColorTheme.TEXT_100),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Amicons.flaticon_arrow_left_rounded,
            color: ColorTheme.NEUTRAL_900,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          switch (controller.consultationDetail.value.status) {
            case Status.loading:
              return Center(child: CircularProgressIndicator());
            default:
              var data =
                  controller.consultationDetail.value.data ??
                  ConsultationDetail(
                    state: ConsultationStatus.created,
                    type: ConsultationType.consultation,
                    patient: Profile(
                      fullname: "-",
                      nickname: "-",
                      birthday: DateTime.now(),
                      gender: Gender.male,
                      maritalStatusId: Marital.divorce.id,
                      lastEducationId: Education.bachelor.id,
                      job: "-",
                      religionId: Religion.believers.id,
                      address: "-",
                    ),
                    consultationRequest: ConsultationRequestData(
                      symptom: "",
                      startDate: DateTime.now(),
                    ),
                    recentVisitors: [],
                    visitorRejections: [],
                  );
              return Column(
                children: [
                  if (data.currentVisit?.visitNote != null)
                    SizedBox(height: SpacingTheme.SPACING_4),
                  if (data.currentVisit?.visitNote != null)
                    CardFullInformation(
                      title: "Catatan Dokter",
                      icon: Amicons.flaticon_doctor_rounded,
                      items: [
                        ItemInformation(
                          value: Text(
                            data.currentVisit?.visitNote ?? "-",
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                      ],
                    ),

                  if (data.currentVisit != null &&
                      data.state == ConsultationStatus.scheduled)
                    SizedBox(height: SpacingTheme.SPACING_4),
                  if (data.currentVisit != null &&
                      data.state == ConsultationStatus.scheduled)
                    CardFullInformation(
                      title: "Visitor yang Bertugas",
                      icon: Amicons.remix_user,
                      items: [
                        ItemInformation(
                          value: Text(
                            data.currentVisit!.visitor!,
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                      ],
                    ),
                  if (data.visitResult != null)
                    SizedBox(height: SpacingTheme.SPACING_4),
                  if (data.visitResult != null)
                    CardFullInformation(
                      title: "Hasil Visit",
                      icon: Amicons.lucide_notebook,
                      items: [
                        ItemInformation(
                          title: "Hasil Observasi",
                          value: Text(
                            data.visitResult!.observation,
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                        if (data.visitResult!.sideEffect != null)
                          ItemInformation(
                            title: "Efek Samping",
                            value: Text(
                              data.visitResult!.sideEffect!
                                  ? "Ada"
                                  : "Tidak Ada",
                              style: TextStyleTheme.PARAGRAPH_5,
                            ),
                          ),
                        if (data.visitResult!.resultStatus != null)
                          ItemInformation(
                            title: "Keterangan",
                            value: Text(
                              data.visitResult!.resultStatus!.name,
                              style: TextStyleTheme.PARAGRAPH_5,
                            ),
                          ),
                        if (data.visitResult!.images.isNotEmpty)
                          ItemInformation(
                            title: "Foto Hasil Visit",
                            value: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                spacing: SpacingTheme.SPACING_8,
                                children: data.visitResult!.images
                                    .map((e) => Image.network(e, height: 200))
                                    .toList(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  SizedBox(height: SpacingTheme.SPACING_4),
                  CardFullInformation(
                    title: "Keterangan Pasien",
                    icon: Amicons.remix_message,
                    items: [
                      ItemInformation(
                        title: "Keluhan",
                        value: Text(
                          data.consultationRequest.symptom,
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                      ItemInformation(
                        title: "Tanggal Awal Keluhan",
                        value: Text(
                          DateTimeUtils.dateToDayMonthYear(
                            data.consultationRequest.startDate,
                          ),
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                      if (data.consultationRequest.image != null)
                        ItemInformation(
                          title: "Foto",
                          value: Image.network(
                            data.consultationRequest.image!,
                            height: 200,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: SpacingTheme.SPACING_4),
                  CardExpandedInformation(
                    title: "Data Diri Pasien",
                    icon: Amicons.remix_user3,
                    items: [
                      ItemInformation(
                        title: "Nama Lengkap",
                        value: Text(
                          data.patient.fullname,
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                      ItemInformation(
                        title: "Nama Panggilan",
                        value: Text(
                          data.patient.nickname,
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SpacingTheme.SPACING_4),
                  if (data.caregiver != null)
                    CardExpandedInformation(
                      title: "Data Diri Pengasuh",
                      icon: Amicons.remix_user5,
                      items: [
                        ItemInformation(
                          title: "Nama Lengkap",
                          value: Text(
                            data.caregiver!.fullname,
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                        ItemInformation(
                          title: "Nama Panggilan",
                          value: Text(
                            data.caregiver!.nickname,
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                      ],
                    ),
                  if (data.recentVisitors.isNotEmpty)
                    SizedBox(height: SpacingTheme.SPACING_4),
                  if (data.recentVisitors.isNotEmpty)
                    CardFullInformation(
                      title: "Visitor Sebelumnya",
                      icon: Amicons.remix_user,
                      items: [
                        ItemInformation(
                          value: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: data.recentVisitors.map((visitor) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    spacing: SpacingTheme.SPACING_8,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          DateTimeUtils.dateToDayMonthYear(
                                            visitor.date,
                                          ), // tampilkan tanggal
                                          textAlign: TextAlign.end,
                                          style: TextStyleTheme.PARAGRAPH_5,
                                        ),
                                      ),
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          color: ColorTheme.NEUTRAL_700,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          visitor.name, // tampilkan nama
                                          style: TextStyleTheme.PARAGRAPH_5,
                                        ),
                                      ),
                                    ],
                                  ),

                                  // --- GARIS SAMBUNG DI BAWAH (kecuali item terakhir) ---
                                  if (data.recentVisitors.last != visitor)
                                    Container(
                                      width:
                                          100 +
                                          16 +
                                          4.5, // menyesuaikan contohmu sebelumnya
                                      height: 16,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: ColorTheme.NEUTRAL_700,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            }).toList(),

                            // children: [
                            //   Row(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     spacing: SpacingTheme.SPACING_8,
                            //     children: [
                            //       SizedBox(
                            //         width: 100,
                            //         child: Text(
                            //           "12 Mei 2025",
                            //           textAlign: TextAlign.end,
                            //           style: TextStyleTheme.PARAGRAPH_5,
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 8,
                            //         height: 8,
                            //         decoration: BoxDecoration(
                            //           color: ColorTheme.NEUTRAL_700,
                            //           shape: BoxShape.circle,
                            //         ),
                            //       ),
                            //       Expanded(
                            //         child: Text(
                            //           "I Komang",
                            //           style: TextStyleTheme.PARAGRAPH_5,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            //   Container(
                            //     width: 100 + 16 + 4.5,
                            //     height: 16,
                            //     decoration: BoxDecoration(
                            //       border: Border(
                            //         right: BorderSide(
                            //           color: ColorTheme.NEUTRAL_700,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            //   Row(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     spacing: SpacingTheme.SPACING_8,
                            //     children: [
                            //       SizedBox(
                            //         width: 100,
                            //         child: Text(
                            //           "13 Apr 2025",
                            //           textAlign: TextAlign.end,
                            //           style: TextStyleTheme.PARAGRAPH_5,
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 8,
                            //         height: 8,
                            //         decoration: BoxDecoration(
                            //           color: ColorTheme.NEUTRAL_700,
                            //           shape: BoxShape.circle,
                            //         ),
                            //       ),
                            //       Expanded(
                            //         child: Text(
                            //           "I Made",
                            //           style: TextStyleTheme.PARAGRAPH_5,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ],
                          ),
                        ),
                      ],
                    ),
                  if (data.visitorRejections.isNotEmpty)
                    SizedBox(height: SpacingTheme.SPACING_4),
                  if (data.visitorRejections.isNotEmpty)
                    CardFullInformation(
                      title: "Visitor yang Menolak",
                      icon: Amicons.remix_user,
                      items: [
                        ItemInformation(
                          value: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: data.visitorRejections
                                .map(
                                  (rejection) => Text(
                                    "${rejection.name} - ${DateTimeUtils.dateToDayMonthYear(rejection.time)} ${DateTimeUtils.dateToHoursMinute(rejection.time)}",
                                    style: TextStyleTheme.PARAGRAPH_5,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                ],
              );
          }
        }),
      ),
      bottomNavigationBar: Obx(() {
        if (controller.consultationDetail.value.data != null &&
            controller.consultationDetail.value.status == Status.success &&
            controller.user.value?.role == Role.doctor) {
          var data = controller.consultationDetail.value.data!;

          if (data.state == ConsultationStatus.created) {
            return Container(
              padding: EdgeInsetsGeometry.only(
                left: SpacingTheme.SPACING_8,
                right: SpacingTheme.SPACING_8,
                bottom: SpacingTheme.SPACING_14,
                top: SpacingTheme.SPACING_8,
              ),
              decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
              child: Row(
                spacing: SpacingTheme.SPACING_4,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(),
                      onPressed: () {
                        Get.toNamed(
                          Routes.DIAGNOSIS_FORM,
                          arguments: DiagnosisFormSettings(
                            controller.consultationRequestDetailSettings.id,
                          ),
                        );
                      },
                      child: Text(
                        "Beri Diagnosa",
                        style: TextStyleTheme.LABEL_1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.VISIT_SCHEDULE_FORM,
                          arguments: VisitScheduleFormSettings(
                            visitorRejection: data.visitorRejections.isNotEmpty
                                ? data.visitorRejections[0]
                                : null,
                            id: controller.consultationRequestDetailSettings.id,
                          ),
                        );
                      },
                      child: Text(
                        data.visitorRejections.isNotEmpty
                            ? "Ulang Jadwalkan Visit"
                            : "Jadwalkan Visit",
                        style: TextStyleTheme.LABEL_1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (data.state == ConsultationStatus.needDiagnosis &&
              controller.user.value?.role == Role.doctor) {
            return Container(
              padding: EdgeInsetsGeometry.only(
                left: SpacingTheme.SPACING_8,
                right: SpacingTheme.SPACING_8,
                bottom: SpacingTheme.SPACING_14,
                top: SpacingTheme.SPACING_8,
              ),
              decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
              child: Row(
                spacing: SpacingTheme.SPACING_4,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(),
                      onPressed: () {
                        Get.toNamed(
                          Routes.DIAGNOSIS_FORM,
                          arguments: DiagnosisFormSettings(
                            controller.consultationRequestDetailSettings.id,
                          ),
                        );
                      },
                      child: Text(
                        "Beri Diagnosa",
                        style: TextStyleTheme.LABEL_1,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        }
        return SizedBox();
      }),
    );
  }
}

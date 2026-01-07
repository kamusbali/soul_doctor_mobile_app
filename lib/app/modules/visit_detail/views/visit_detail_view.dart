import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/consultation_detail.dart';
import 'package:soul_doctor/app/domain/model/consultation_request_data.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/model/consultation_type.dart';
import 'package:soul_doctor/app/domain/model/gender.dart';
import 'package:soul_doctor/app/domain/model/profile.dart';
import 'package:soul_doctor/app/helpers/date_time_utils.dart';
import 'package:soul_doctor/app/modules/report_visit/settings/report_visit_settings.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
import 'package:soul_doctor/app/widgets/card/card_expanded_information.dart';
import 'package:soul_doctor/app/widgets/card/card_full_information.dart';
import 'package:soul_doctor/app/widgets/item/item_information.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/visit_detail_controller.dart';

class VisitDetailView extends GetView<VisitDetailController> {
  const VisitDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.visitDataStatus.value.status == Status.loading ||
          controller.acceptVisitStatus.value.status == Status.loading ||
          controller.rejectVisitStatus.value.status == Status.loading) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        var data =
            controller.visitDataStatus.value.data ??
            ConsultationDetail(
              state: ConsultationStatus.created,
              type: ConsultationType.consultation,
              patient: Profile(
                fullname: "-",
                nickname: "-",
                birthday: DateTime.now(),
                gender: Gender.male,
                maritalStatusId: 1,
                lastEducationId: 1,
                job: "-",
                religionId: 1,
                address: "'-",
              ),
              consultationRequest: ConsultationRequestData(
                symptom: "-",
                startDate: DateTime.now(),
              ),
              recentVisitors: [],
              visitorRejections: [],
            );
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Visit',
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
            child: Column(
              children: [
                SizedBox(height: SpacingTheme.SPACING_4),
                if (data.currentVisit != null)
                  CardFullInformation(
                    title: "Catatan Dokter",
                    icon: Amicons.remix_user_heart,
                    items: [
                      ItemInformation(
                        value: Text(
                          data.currentVisit!.visitNote ?? "-",
                          style: TextStyleTheme.PARAGRAPH_5,
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
                SizedBox(height: SpacingTheme.SPACING_4),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        ),
                      ),
                    ],
                  ),
                if (data.state == ConsultationStatus.completed)
                  SizedBox(height: SpacingTheme.SPACING_4),
                if (data.state == ConsultationStatus.completed &&
                    data.visitResult != null)
                  CardFullInformation(
                    title: "Hasil Visit",
                    icon: Amicons.vuesax_note_2,
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
                            data.visitResult!.sideEffect! ? "Ada" : "Tidak Ada",
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
                              children: data.visitResult!.images
                                  .map((e) => Image.network(e, height: 200))
                                  .toList(),
                            ),
                          ),
                        ),
                    ],
                  ),
                if (data.state == ConsultationStatus.completed)
                  SizedBox(height: SpacingTheme.SPACING_4),
                if (data.state == ConsultationStatus.completed &&
                    data.doctorDiagnosis != null)
                  CardFullInformation(
                    title: "Response Dokter",
                    icon: Amicons.remix_stethoscope,
                    items: [
                      ItemInformation(
                        title: "Diagnosis",
                        value: Text(
                          data.doctorDiagnosis!.diagnosis,
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                      ItemInformation(
                        title: "Obat",
                        value: Text(
                          data.doctorDiagnosis!.medication ?? "-",
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                      ItemInformation(
                        title: "Terapi",
                        value: Text(
                          data.doctorDiagnosis!.therapy ?? "-",
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                      ItemInformation(
                        title: "Catatan",
                        value: Text(
                          data.doctorDiagnosis!.note ?? "-",
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
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
                if (data.state == ConsultationStatus.waitingVolunteer)
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(),
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
                                    "Berikan Alasan Penolakan",
                                    style: TextStyleTheme.BODY_1.copyWith(
                                      color: ColorTheme.TEXT_100,
                                    ),
                                  ),
                                ),
                                SizedBox(height: SpacingTheme.SPACING_6),
                                Obx(
                                  () => TextField(
                                    controller: controller.reasonController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorTheme.NEUTRAL_500,
                                        ),
                                      ),
                                      errorText:
                                          controller.reasonErrorText.value,
                                      labelText: "Alasan Penolakan",
                                      alignLabelWithHint: true,
                                      filled: true,
                                      fillColor: ColorTheme.NEUTRAL_100,
                                    ),
                                    maxLines: 5,
                                  ),
                                ),
                                SizedBox(height: SpacingTheme.SPACING_6),
                                Row(
                                  spacing: SpacingTheme.SPACING_4,
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(),
                                        onPressed: controller.onRejectVisit,
                                        child: Text(
                                          "Kirim penolakan",
                                          style: TextStyleTheme.LABEL_1,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FilledButton(
                                        style: FilledButton.styleFrom(),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          "Batal",
                                          style: TextStyleTheme.LABEL_1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Text("Tolak", style: TextStyleTheme.LABEL_1),
                    ),
                  ),
                if (data.state == ConsultationStatus.waitingVolunteer)
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(),
                      onPressed: controller.onAcceptVisit,
                      child: Text("Terima", style: TextStyleTheme.LABEL_1),
                    ),
                  ),
                if (data.state == ConsultationStatus.scheduled)
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.REPORT_VISIT,
                          arguments: ReportVisitSettings(
                            isHasData:
                                !controller.visitDetailSettings.isFirstVisit,
                            visitId: controller
                                .visitDataStatus
                                .value
                                .data!
                                .currentVisit!
                                .visitId,
                          ),
                        );
                      },
                      child: Text(
                        "Catat Hasil Visit",
                        style: TextStyleTheme.LABEL_1,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }
    });
  }
}

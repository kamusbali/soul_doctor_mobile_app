import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/helpers/date_time_utils.dart';
import 'package:soul_doctor/app/widgets/card/card_expanded_information.dart';
import 'package:soul_doctor/app/widgets/card/card_full_information.dart';
import 'package:soul_doctor/app/widgets/item/item_information.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/patient_detail_history_controller.dart';

class PatientDetailHistoryView extends GetView<PatientDetailHistoryController> {
  const PatientDetailHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Pasien',
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
      body: Obx(() {
        if (controller.patientDataStatus.value.status == Status.loading ||
            controller.patientDataStatus.value.status == Status.none) {
          return Center(child: CircularProgressIndicator());
        } else {
          var data = controller.patientDataStatus.value.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SpacingTheme.SPACING_4),
                CardExpandedInformation(
                  title: 'Keterangan Pasien',
                  icon: Amicons.remix_user2,
                  items: [
                    ItemInformation(
                      title: "Nama Lengkap",
                      value: Text(
                        data?.patient.fullname ?? "-",
                        style: TextStyleTheme.PARAGRAPH_5,
                      ),
                    ),
                    ItemInformation(
                      title: "Nama Panggilan",
                      value: Text(
                        data?.patient.nickname ?? "-",
                        style: TextStyleTheme.PARAGRAPH_5,
                      ),
                    ),
                    ItemInformation(
                      title: "Tanggal Lahir",
                      value: Text(
                        data?.patient.birthday == null
                            ? "-"
                            : DateTimeUtils.dateToDayMonthYear(
                                data!.patient.birthday,
                              ),
                        style: TextStyleTheme.PARAGRAPH_5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SpacingTheme.SPACING_4),
                if (data?.caregiver != null)
                  CardExpandedInformation(
                    title: 'Data Diri Pengasuh',
                    icon: Amicons.remix_user2,
                    items: [
                      ItemInformation(
                        title: "Nama Lengkap",
                        value: Text(
                          data?.caregiver?.fullname ?? "-",
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                      ItemInformation(
                        title: "Nama Panggilan",
                        value: Text(
                          data?.caregiver?.nickname ?? "-",
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                      ItemInformation(
                        title: "Tanggal Lahir",
                        value: Text(
                          data?.patient.birthday == null
                              ? "-"
                              : DateTimeUtils.dateToDayMonthYear(
                                  data!.patient.birthday,
                                ),
                          style: TextStyleTheme.PARAGRAPH_5,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: SpacingTheme.SPACING_4),
                CardFullInformation(
                  title: "Riwayat Penyakit Pasien",
                  icon: Amicons.remix_thermometer,
                  items: [
                    ItemInformation(
                      title: "Heteroanamnesis",
                      value: Text(
                        data?.patientHistory?.heteroanamnesis ?? "-",
                        style: TextStyleTheme.PARAGRAPH_5,
                      ),
                    ),
                    ItemInformation(
                      title: "Riwayat Penyakit",
                      value: Text(
                        data?.patientHistory?.diseaseHistory ?? "-",
                        style: TextStyleTheme.PARAGRAPH_5,
                      ),
                    ),
                    ItemInformation(
                      title: "Riwayat Keluarga",
                      value: Text(
                        data?.patientHistory?.familyHistory ?? "-",
                        style: TextStyleTheme.PARAGRAPH_5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SpacingTheme.SPACING_4),
                if (data != null)
                  ...data.consultations.map(
                    (e) => CardExpandedInformation(
                      title:
                          'Riwayat Konsultasi ${DateTimeUtils.dateToDayMonthYear(e.date)}',
                      icon: Amicons.lucide_briefcase_medical,
                      items: [
                        ItemInformation(
                          title: "Keluhan",
                          value: Text(
                            e.compactConsultationDetail?.symptom ?? "-",
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                        ItemInformation(
                          title: "Tanggal Awal Keluhan",
                          value: Text(
                            e.compactConsultationDetail?.startDate == null
                                ? "-"
                                : DateTimeUtils.dateToDayMonthYear(
                                    e.compactConsultationDetail!.startDate,
                                  ),
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                        ItemInformation(
                          title: "Hasil Observasi Volunteer",
                          value: Text(
                            e.compactConsultationDetail?.observation ?? "-",
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                        ItemInformation(
                          title: "Diagnosis Dokter",
                          value: Text(
                            e.compactConsultationDetail?.diagnosis ?? "-",
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                        ItemInformation(
                          title: "Obat",
                          value: Text(
                            e.compactConsultationDetail?.medication ?? "-",
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                        ItemInformation(
                          title: "Terapi",
                          value: Text(
                            e.compactConsultationDetail?.therapy ?? "-",
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                        ItemInformation(
                          title: "Visitor",
                          value: Text(
                            e.compactConsultationDetail?.visitor ?? "-",
                            style: TextStyleTheme.PARAGRAPH_5,
                          ),
                        ),
                        if (e.compactConsultationDetail != null &&
                            e.compactConsultationDetail!.visitImages.isNotEmpty)
                          ItemInformation(
                            title: "Foto Hasil Visit",
                            value: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                spacing: SpacingTheme.SPACING_8,
                                children: e
                                    .compactConsultationDetail!
                                    .visitImages
                                    .map((e) => Image.network(e, height: 200))
                                    .toList(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        }
      }),
    );
  }
}

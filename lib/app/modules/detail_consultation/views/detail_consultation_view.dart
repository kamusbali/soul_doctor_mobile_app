import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/helpers/date_time_utils.dart';
import 'package:soul_doctor/app/modules/detail_consultation/widgets/list_consultation_data.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

import '../controllers/detail_consultation_controller.dart';

class DetailConsultationView extends GetView<DetailConsultationController> {
  const DetailConsultationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Konsultasi',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Obx(() {
              switch (controller.consultationDetail.value.status) {
                case Status.loading:
                  return Center(child: CircularProgressIndicator());
                case Status.success:
                  var data = controller.consultationDetail.value.data!;
                  return Column(
                    spacing: SpacingTheme.SPACING_6,
                    children: [
                      ListConsultationData(
                        title: 'Status',
                        body: data.state.getName(controller.sessionData?.role),
                        icon: Amicons.lucide_notebook,
                      ),
                      ListConsultationData(
                        title: 'Keluhan',
                        body: data.consultationRequest.symptom,
                        icon: Amicons.flaticon_comment_rounded,
                      ),
                      if (data.state == ConsultationStatus.created)
                        ListConsultationData(
                          title: 'Tanggal Awal Keluhan',
                          body: DateTimeUtils.dateToDayMonthYear(
                            data.consultationRequest.startDate,
                          ),
                          icon: Amicons.remix_calendar,
                        ),
                      if (data.doctorDiagnosis != null)
                        ListConsultationData(
                          title: 'Diagnosa Dokter',
                          body: data.doctorDiagnosis!.diagnosis,
                          icon: Amicons.flaticon_stethoscope_rounded,
                        ),
                      if (data.doctorDiagnosis != null &&
                          data.doctorDiagnosis?.medication != null)
                        ListConsultationData(
                          title: 'Obat',
                          body: data.doctorDiagnosis?.medication,
                          icon: Amicons.lucide_pill,
                        ),
                      if (data.doctorDiagnosis != null &&
                          data.doctorDiagnosis?.therapy != null)
                        ListConsultationData(
                          title: 'Terapi',
                          body: data.doctorDiagnosis?.therapy,
                          icon: Amicons.flaticon_hand_holding_heart_rounded,
                        ),
                      if (data.doctorDiagnosis != null &&
                          data.doctorDiagnosis?.note != null)
                        ListConsultationData(
                          title: 'Catatan Dokter',
                          body: data.doctorDiagnosis?.note,
                          icon: Amicons.flaticon_notebook_rounded,
                        ),
                      if (data.state == ConsultationStatus.scheduled)
                        ListConsultationData(
                          title: 'Visitor',
                          body: data.currentVisit?.visitor,
                          icon: Amicons.flaticon_user_rounded,
                        ),
                    ],
                  );
                default:
                  return Column(
                    spacing: SpacingTheme.SPACING_6,
                    children: [
                      ListConsultationData(
                        title: 'Keluhan',
                        body: '-',
                        icon: Amicons.flaticon_comment_rounded,
                      ),
                      ListConsultationData(
                        title: 'Diagnosa Dokter',
                        body: '-',
                        icon: Amicons.flaticon_stethoscope_rounded,
                      ),
                      ListConsultationData(
                        title: 'Obat',
                        body: "-",
                        icon: Amicons.lucide_pill,
                      ),
                      ListConsultationData(
                        title: 'Terapi',
                        body: "-",
                        icon: Amicons.flaticon_hand_holding_heart_rounded,
                      ),
                      ListConsultationData(
                        title: 'Catatan Dokter',
                        body: '-',
                        icon: Amicons.flaticon_notebook_rounded,
                      ),
                      ListConsultationData(
                        title: 'Visitor',
                        body: '-',
                        icon: Amicons.flaticon_user_rounded,
                      ),
                    ],
                  );
              }
            }),
          ),
        ),
      ),
    );
  }
}

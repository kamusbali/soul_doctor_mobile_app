import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
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
                      // ListConsultationData(
                      //   title: 'Keluhan',
                      //   body: data.state.getName(controller.sessionData?.role),
                      //   icon: Amicons.flaticon_comment_rounded,
                      // ),
                      ListConsultationData(
                        title: 'Keluhan',
                        body: data.symptom,
                        icon: Amicons.flaticon_comment_rounded,
                      ),
                      ListConsultationData(
                        title: 'Diagnosa Dokter',
                        body: data.diagnosis,
                        icon: Amicons.flaticon_stethoscope_rounded,
                      ),
                      ListConsultationData(
                        title: 'Obat',
                        body: data.medication,
                        icon: Amicons.lucide_pill,
                      ),
                      ListConsultationData(
                        title: 'Terapi',
                        body: data.therapy,
                        icon: Amicons.flaticon_hand_holding_heart_rounded,
                      ),
                      ListConsultationData(
                        title: 'Catatan Dokter',
                        body: 'Jangan malas',
                        icon: Amicons.flaticon_notebook_rounded,
                      ),
                      ListConsultationData(
                        title: 'Visitor',
                        body: data.visitor,
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

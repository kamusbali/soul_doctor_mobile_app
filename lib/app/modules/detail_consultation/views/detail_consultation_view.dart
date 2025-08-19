import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/modules/detail_consultation/widgets/list_consultation_data.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';

import '../controllers/detail_consultation_controller.dart';

class DetailConsultationView extends GetView<DetailConsultationController> {
  const DetailConsultationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konsultasi 26 April 2025',
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
            child: Column(
              spacing: SpacingTheme.SPACING_6,
              children: [
                ListConsultationData(
                  title: 'Keluhan',
                  body:
                      'Cemas berlebihan / Kesulitan tidur / Stres  karena pekerjaan',
                  icon: Amicons.flaticon_comment_rounded,
                ),
                ListConsultationData(
                  title: 'Diagnosa Dokter',
                  body: 'Depresi',
                  icon: Amicons.flaticon_stethoscope_rounded,
                ),
                ListConsultationData(
                  title: 'Diagnosa Dokter',
                  bodyList: [
                    "Clonazepam 0.5 mg (1 x sehari sampai habis)",
                    "Amoxicillin 500 mg (3 x sehari sampai habis)",
                  ],
                  icon: Amicons.lucide_pill,
                ),
                ListConsultationData(
                  title: 'Terapi',
                  bodyList: [
                    "Istirahat cukup, kurangi penggunaan gadget sebelum tidur",
                    "Kurangi makanan pedas dan berkafein",
                    "Olahraga ringan dan rutin",
                    "Konsultasi ulang jika keluhan tidak membaik dalam 1 minggu",
                  ],
                  icon: Amicons.flaticon_hand_holding_heart_rounded,
                ),
                ListConsultationData(
                  title: 'Catatan Dokter',
                  body: 'Jangan malas',
                  icon: Amicons.flaticon_notebook_rounded,
                ),
                ListConsultationData(
                  title: 'Visitor',
                  body: 'I Made Balik',
                  icon: Amicons.flaticon_user_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

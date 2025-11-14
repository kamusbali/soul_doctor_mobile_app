import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SpacingTheme.SPACING_4),
            CardExpandedInformation(
              title: 'Keterangan Pasien',
              icon: Amicons.remix_user2,
              futureItems: () async {
                await Future.delayed(Duration(seconds: 2));
                return [
                  ItemInformation(
                    title: "Nama Lengkap",
                    value: Text("I Wayan", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Nama Panggilan",
                    value: Text("Abo", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Tanggal Lahir",
                    value: Text(
                      "1 Januari 1956",
                      style: TextStyleTheme.PARAGRAPH_5,
                    ),
                  ),
                ];
              },
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            CardExpandedInformation(
              title: 'Data Diri Pengasuh',
              icon: Amicons.remix_user2,
              futureItems: () async {
                await Future.delayed(Duration(seconds: 2));
                return [
                  ItemInformation(
                    title: "Nama Lengkap",
                    value: Text("I Wayan", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Nama Panggilan",
                    value: Text("Abo", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Tanggal Lahir",
                    value: Text(
                      "1 Januari 1956",
                      style: TextStyleTheme.PARAGRAPH_5,
                    ),
                  ),
                ];
              },
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            CardFullInformation(
              title: "Riwayat Penyakit Pasien",
              icon: Amicons.remix_thermometer,
              items: [
                ItemInformation(
                  title: "Heteroanamnesis",
                  value: Text("-", style: TextStyleTheme.PARAGRAPH_5),
                ),
                ItemInformation(
                  title: "Riwayat Penyakit",
                  value: Text("-", style: TextStyleTheme.PARAGRAPH_5),
                ),
                ItemInformation(
                  title: "Riwayat Keluarga",
                  value: Text("-", style: TextStyleTheme.PARAGRAPH_5),
                ),
              ],
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            CardExpandedInformation(
              title: 'Riwayat Konsultasi 12 Januari 2025',
              icon: Amicons.lucide_briefcase_medical,
              futureItems: () async {
                await Future.delayed(Duration(seconds: 2));
                return [
                  ItemInformation(
                    title: "Keluhan",
                    value: Text("Batuk", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Tanggal Awal Keluhan",
                    value: Text(
                      "1 Januari 2025",
                      style: TextStyleTheme.PARAGRAPH_5,
                    ),
                  ),
                  ItemInformation(
                    title: "Hasil Observasi Volunteer",
                    value: Text(
                      "Pasien mengalami gejala susah tidur",
                      style: TextStyleTheme.PARAGRAPH_5,
                    ),
                  ),
                  ItemInformation(
                    title: "Diagnosis Dokter",
                    value: Text("Pilek", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Obat",
                    value: Text("Demacolyn", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Terapi",
                    value: Text("-", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Visitor",
                    value: Text("-", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Foto Hasil Visit",
                    value: Text("-", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}

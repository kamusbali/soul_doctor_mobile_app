import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/widgets/card/card_expanded_information.dart';
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
                  ItemInformation(title: "Nama Lengkap", value: "I Wayan"),
                  ItemInformation(title: "Nama Panggilan", value: "Abo"),
                  ItemInformation(
                    title: "Tanggal Lahir",
                    value: "1 Januari 1956",
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

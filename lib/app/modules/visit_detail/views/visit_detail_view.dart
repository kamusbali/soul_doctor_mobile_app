import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
            CardFullInformation(
              title: "Catatan Dokter",
              icon: Amicons.remix_user_heart,
              items: [
                ItemInformation(
                  value: Text("Perlu visit", style: TextStyleTheme.PARAGRAPH_5),
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
                    "Perasaan hampa dan kehilangan semangat",
                    style: TextStyleTheme.PARAGRAPH_5,
                  ),
                ),
                ItemInformation(
                  title: "Tanggal Awal Keluhan",
                  value: Text("13 Mei 2025", style: TextStyleTheme.PARAGRAPH_5),
                ),
                ItemInformation(
                  title: "Foto",
                  value: Text("-", style: TextStyleTheme.PARAGRAPH_5),
                ),
              ],
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            CardExpandedInformation(
              title: "Data Diri Pasien",
              icon: Amicons.remix_user3,
              futureItems: () async {
                return [
                  ItemInformation(
                    title: "Nama Lengkap",
                    value: Text("I Putu", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                  ItemInformation(
                    title: "Nama Panggilan",
                    value: Text("Abo", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                ];
              },
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            CardExpandedInformation(
              title: "Data Diri Pengasuh",
              icon: Amicons.remix_user5,
              futureItems: () async {
                return [
                  ItemInformation(
                    title: "Nama Lengkap",
                    value: Text(
                      "Anak Agung Sagung Sari Dewi Lestari",
                      style: TextStyleTheme.PARAGRAPH_5,
                    ),
                  ),
                  ItemInformation(
                    title: "Nama Panggilan",
                    value: Text("Gung Dewi", style: TextStyleTheme.PARAGRAPH_5),
                  ),
                ];
              },
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
            CardFullInformation(
              title: "Visitor Sebelumnya",
              icon: Amicons.remix_user,
              items: [
                ItemInformation(
                  value: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: SpacingTheme.SPACING_8,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "12 Mei 2025",
                              textAlign: TextAlign.end,
                              style: TextStyleTheme.PARAGRAPH_5,
                            ),
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: ColorTheme.NEUTRAL_700,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "I Komang",
                              style: TextStyleTheme.PARAGRAPH_5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 100 + 16 + 4.5,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: ColorTheme.NEUTRAL_700),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: SpacingTheme.SPACING_8,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "13 Apr 2025",
                              textAlign: TextAlign.end,
                              style: TextStyleTheme.PARAGRAPH_5,
                            ),
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: ColorTheme.NEUTRAL_700,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "I Made",
                              style: TextStyleTheme.PARAGRAPH_5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SpacingTheme.SPACING_4),
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
            // Expanded(
            //   child: OutlinedButton(
            //     style: OutlinedButton.styleFrom(),
            //     onPressed: () {},
            //     child: Text("Tolak", style: TextStyleTheme.LABEL_1),
            //   ),
            // ),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  Get.toNamed(Routes.REPORT_VISIT);
                },
                child: Text("Catat Hasil Visit", style: TextStyleTheme.LABEL_1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/report_visit_controller.dart';

class ReportVisitView extends GetView<ReportVisitController> {
  const ReportVisitView({super.key});
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
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: SpacingTheme.SPACING_8,
            vertical: SpacingTheme.SPACING_8,
          ),
          child: Obx(
            () => Column(
              children: [
                Row(
                  spacing: SpacingTheme.SPACING_4,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentForm.value == 0
                            ? ColorTheme.NEUTRAL_100
                            : ColorTheme.CRIMSON_500,
                        border: Border.all(
                          color: ColorTheme.CRIMSON_500,
                          width: 4,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: controller.currentForm.value == 1
                          ? Icon(
                              Amicons.remix_check,
                              size: 16,
                              color: ColorTheme.NEUTRAL_100,
                            )
                          : Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorTheme.CRIMSON_500,
                              ),
                            ),
                    ),
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: controller.currentForm.value == 1
                              ? ColorTheme.CRIMSON_500
                              : ColorTheme.NEUTRAL_500,
                        ),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: controller.currentForm.value == 0
                              ? ColorTheme.NEUTRAL_500
                              : ColorTheme.CRIMSON_500,
                          width: 4,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: controller.currentForm.value == 1
                          ? Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorTheme.CRIMSON_500,
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
                SizedBox(height: SpacingTheme.SPACING_4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Data riwayat pasien",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      child: Text("Observasi", textAlign: TextAlign.right),
                    ),
                  ],
                ),
                SizedBox(height: SpacingTheme.SPACING_12),
                if (controller.currentForm.value == 0)
                  Column(
                    spacing: SpacingTheme.SPACING_8,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          hintText: "Kerjasama Penanganan",
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          hintText: "Keluhan Utama",
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                        maxLines: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          hintText: "Autoanamnesis",
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                        maxLines: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          hintText: "Riwayat Penyakit",
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                        maxLines: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          hintText: "Riwayat Keluarga",
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                        maxLines: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          hintText: "Heteroanamnesis",
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                        maxLines: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          hintText: "Riwayat Pengobatan",
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                        maxLines: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          hintText: "Status Psikiatri",
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                        maxLines: 5,
                      ),
                    ],
                  ),
                if (controller.currentForm.value == 1)
                  Column(
                    spacing: SpacingTheme.SPACING_8,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          hintText: "Hasil Observasi",
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                        maxLines: 5,
                      ),
                      Row(
                        spacing: SpacingTheme.SPACING_4,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorTheme.NEUTRAL_500,
                                  ),
                                ),
                                hintText: "Foto (Optional)",
                                filled: true,
                                fillColor: ColorTheme.NEUTRAL_100,
                                suffixIcon: Icon(
                                  Amicons.flaticon_cloud_upload_rounded,
                                  color: ColorTheme.NEUTRAL_700,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Amicons.flaticon_trash_rounded,
                              color: ColorTheme.CRIMSON_500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(
          left: SpacingTheme.SPACING_8,
          right: SpacingTheme.SPACING_8,
          bottom: SpacingTheme.SPACING_14,
          top: SpacingTheme.SPACING_8,
        ),
        child: Obx(
          () => FilledButton(
            onPressed: () {
              if (controller.currentForm.value == 1) {
                Get.offAllNamed(Routes.WRAPPER);
              }

              controller.onChangeCurrentForm(controller.currentForm.value + 1);
            },
            child: Text(
              controller.currentForm.value == 1
                  ? "Kirim Catatan"
                  : "Selanjutnya",
              style: TextStyleTheme.LABEL_1,
            ),
          ),
        ),
      ),
    );
  }
}

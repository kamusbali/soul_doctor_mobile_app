import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/add_consultation_controller.dart';

class AddConsultationView extends GetView<AddConsultationController> {
  const AddConsultationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.addConsultationState.value.status) {
        case Status.loading:
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        default:
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Formulir Pengajuan Konsultasi',
                style: TextStyleTheme.BODY_2.copyWith(
                  color: ColorTheme.TEXT_100,
                ),
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
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.symptomController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                        ),
                        labelText: "Keluhan*",
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: ColorTheme.NEUTRAL_100,
                      ),
                      maxLines: 5,
                    ),
                    SizedBox(height: SpacingTheme.SPACING_8),
                    TextFormField(
                      readOnly: true,
                      controller: controller.startDateController,
                      onTap: controller.onSelectDateBirth,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                        ),
                        labelText: "Tanggal Awal Keluhan*",
                        filled: true,
                        fillColor: ColorTheme.NEUTRAL_100,
                        suffixIcon: Icon(
                          Amicons.flaticon_calendar_rounded,
                          color: ColorTheme.NEUTRAL_700,
                        ),
                      ),
                    ),
                    SizedBox(height: SpacingTheme.SPACING_8),
                    Row(
                      spacing: SpacingTheme.SPACING_4,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.pictureController,
                            onTap: () {
                              controller.onAddPicture();
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              labelText: "Foto (opsional)",
                              filled: true,
                              fillColor: ColorTheme.NEUTRAL_100,
                              suffixIcon: Icon(
                                Amicons.flaticon_cloud_upload_rounded,
                                color: ColorTheme.NEUTRAL_700,
                              ),
                            ),
                          ),
                        ),
                        if (controller.picture.value.path != "")
                          IconButton(
                            onPressed: () {
                              controller.onClearPicture();
                            },
                            icon: Icon(
                              Amicons.flaticon_trash_rounded,
                              color: ColorTheme.CRIMSON_500,
                            ),
                          ),
                      ],
                    ),
                  ],
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
              child: FilledButton(
                onPressed: controller.onAddConsultation,
                child: Text("Ajukan Konsultasi", style: TextStyleTheme.LABEL_1),
              ),
            ),
          );
      }
    });
  }
}

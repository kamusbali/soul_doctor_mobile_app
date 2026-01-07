import 'package:amicons/amicons.dart';
import 'package:async_dropdown/async_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/domain/model/visit_result_status.dart';
import 'package:soul_doctor/app/helpers/validators.dart';

import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/report_visit_controller.dart';

class ReportVisitView extends GetView<ReportVisitController> {
  const ReportVisitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.addReportStatus.value.status) {
        case Status.loading:
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        default:
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Visit',
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
                child: Obx(
                  () => Column(
                    children: [
                      if (!controller.reportVisitSettings.isHasData)
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
                      if (!controller.reportVisitSettings.isHasData)
                        SizedBox(height: SpacingTheme.SPACING_4),
                      if (!controller.reportVisitSettings.isHasData)
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Data riwayat pasien",
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Observasi",
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: SpacingTheme.SPACING_12),
                      if (controller.currentForm.value == 0)
                        Form(
                          key: controller.historyPatientFormKey,
                          child: Column(
                            spacing: SpacingTheme.SPACING_8,
                            children: [
                              TextFormField(
                                controller: controller.cooperationController,
                                validator: (value) =>
                                    Validators.onNotEmptyValidation(
                                      value,
                                      "Kerjasama Penanganan",
                                    ),
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
                                controller: controller.mainDiseaseController,
                                validator: (value) =>
                                    Validators.onNotEmptyValidation(
                                      value,
                                      "Keluhan Utama",
                                    ),
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
                                controller: controller.autoanamnesisController,
                                validator: (value) =>
                                    Validators.onNotEmptyValidation(
                                      value,
                                      "Autoanamnesis",
                                    ),
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
                                controller: controller.diseaseHistoryController,
                                validator: (value) =>
                                    Validators.onNotEmptyValidation(
                                      value,
                                      "Riwayat Penyakit",
                                    ),
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
                                controller: controller.familyHistoryController,
                                validator: (value) =>
                                    Validators.onNotEmptyValidation(
                                      value,
                                      "Riwayat Keluarga",
                                    ),
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
                                controller:
                                    controller.heteroanamnesisController,
                                validator: (value) =>
                                    Validators.onNotEmptyValidation(
                                      value,
                                      "Heteroanamnesis",
                                    ),
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
                                controller:
                                    controller.medicationHistoryController,
                                validator: (value) =>
                                    Validators.onNotEmptyValidation(
                                      value,
                                      "Riwayat Pengobatan",
                                    ),
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
                                controller:
                                    controller.psychiatricStatusController,
                                validator: (value) =>
                                    Validators.onNotEmptyValidation(
                                      value,
                                      "Status Psikiatri",
                                    ),
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
                        ),
                      if (controller.currentForm.value == 1)
                        Form(
                          key: controller.observationFormKey,
                          child: Column(
                            spacing: SpacingTheme.SPACING_8,
                            children: [
                              TextFormField(
                                controller: controller.observation,
                                validator: (value) =>
                                    Validators.onNotEmptyValidation(
                                      value,
                                      "Hasil Observasi",
                                    ),
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
                              TextFormField(
                                readOnly: true,
                                onTap: () {
                                  controller.onAddPicture();
                                },
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
                              if (controller.reportVisitSettings.isHasData)
                                Obx(
                                  () => StaticDropdownTextField<bool>(
                                    controller: controller.sideEffectController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorTheme.NEUTRAL_500,
                                        ),
                                      ),
                                      labelText: "Efek Samping",
                                      filled: true,
                                      errorText:
                                          controller.sideEffectErrorText.value,
                                      fillColor: ColorTheme.NEUTRAL_100,
                                      alignLabelWithHint: true,
                                    ),
                                    childWidget: (data) => Padding(
                                      padding: EdgeInsetsGeometry.symmetric(
                                        horizontal: SpacingTheme.SPACING_8,
                                        vertical: SpacingTheme.SPACING_4,
                                      ),
                                      child: Text(
                                        data ? "Ada" : "Tidak Ada",
                                        style: TextStyleTheme.PARAGRAPH_5,
                                      ),
                                    ),
                                    items: [true, false],
                                    onSelectData: controller.onChangeSideEffect,
                                    onSetTextFieldLabel: (sideEffect) {
                                      if (sideEffect) {
                                        return "Ada";
                                      }
                                      return "Tidak Ada";
                                    },
                                  ),
                                ),
                              if (controller.reportVisitSettings.isHasData)
                                Obx(
                                  () =>
                                      StaticDropdownTextField<
                                        VisitResultStatus
                                      >(
                                        controller: controller
                                            .visitResultStatusController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ColorTheme.NEUTRAL_500,
                                            ),
                                          ),
                                          labelText: "Keterangan",
                                          filled: true,
                                          errorText: controller
                                              .visitResultStatusErrorText
                                              .value,
                                          fillColor: ColorTheme.NEUTRAL_100,
                                          alignLabelWithHint: true,
                                        ),
                                        childWidget: (data) => Padding(
                                          padding: EdgeInsetsGeometry.symmetric(
                                            horizontal: SpacingTheme.SPACING_8,
                                            vertical: SpacingTheme.SPACING_4,
                                          ),
                                          child: Text(
                                            data.name,
                                            style: TextStyleTheme.PARAGRAPH_5,
                                          ),
                                        ),
                                        items: VisitResultStatus.values,
                                        onSelectData: controller
                                            .onChangeVisitResultStatusValue,
                                        onSetTextFieldLabel:
                                            (visitResultStatus) {
                                              return visitResultStatus.name;
                                            },
                                      ),
                                ),
                              SizedBox(height: SpacingTheme.SPACING_2),
                              Obx(
                                () => Column(
                                  spacing: SpacingTheme.SPACING_4,
                                  children: controller.pictures
                                      .asMap()
                                      .entries
                                      .map(
                                        (e) => Row(
                                          spacing: SpacingTheme.SPACING_8,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                e.value.name,
                                                style:
                                                    TextStyleTheme.PARAGRAPH_5,
                                              ),
                                            ),

                                            InkWell(
                                              onTap: () {
                                                controller.onDeletePicture(
                                                  e.key,
                                                );
                                              },
                                              child: Icon(
                                                Amicons.flaticon_trash_rounded,
                                                color: ColorTheme.CRIMSON_500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
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
                      controller.onSendVisitReportData();

                      return;
                    }

                    controller.onChangeCurrentForm(
                      controller.currentForm.value + 1,
                    );
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
    });
  }
}

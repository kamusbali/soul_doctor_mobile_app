import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/diagnosis_form_controller.dart';

class DiagnosisFormView extends GetView<DiagnosisFormController> {
  const DiagnosisFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beri Diagnosa',
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
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                  ),
                  labelText: "Diagnosa",
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: ColorTheme.NEUTRAL_100,
                ),
                maxLines: 5,
              ),
              SizedBox(height: SpacingTheme.SPACING_8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                  ),
                  labelText: "Obat (opsional)",
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: ColorTheme.NEUTRAL_100,
                ),
                maxLines: 5,
              ),
              SizedBox(height: SpacingTheme.SPACING_8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                  ),
                  labelText: "Terapi (opsional)",
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: ColorTheme.NEUTRAL_100,
                ),
                maxLines: 5,
              ),
              SizedBox(height: SpacingTheme.SPACING_8),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                  ),
                  labelText: "Catatan (opsional)",
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: ColorTheme.NEUTRAL_100,
                ),
                maxLines: 5,
              ),
              SizedBox(height: SpacingTheme.SPACING_8),
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
          onPressed: () {},
          child: Text("Kirim Diagnosa", style: TextStyleTheme.LABEL_1),
        ),
      ),
    );
  }
}

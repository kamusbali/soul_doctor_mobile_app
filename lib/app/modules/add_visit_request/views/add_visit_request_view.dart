import 'package:amicons/amicons.dart';
import 'package:async_dropdown/async_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/widgets/header/basic_app_bar.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/add_visit_request_controller.dart';

class AddVisitRequestView extends GetView<AddVisitRequestController> {
  const AddVisitRequestView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Formulir Pengusulan Visit'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: SpacingTheme.SPACING_8,
            vertical: SpacingTheme.SPACING_8,
          ),
          child: Column(
            children: [
              StaticDropdownTextField(
                childWidget: (data) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(data),
                ),
                items: ["Data 1", "Data 2", "Data 3"],
                onSelectData: (selectedData) {},
                onSetTextFieldLabel: (selectedData) {
                  return selectedData;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                  ),
                  hintText: "Nama Pasien",
                  filled: true,
                  fillColor: ColorTheme.NEUTRAL_100,
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_8),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                  ),
                  hintText: "Keluhan",
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
                  hintText: "Tanggal Awal Keluhan",
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
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
          child: Text("Ajukan Konsultasi", style: TextStyleTheme.LABEL_1),
        ),
      ),
    );
  }
}

import 'package:amicons/amicons.dart';
import 'package:async_dropdown/async_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../core/theme/color_theme.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorTheme.NEUTRAL_200,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Amicons.flaticon_arrow_left_rounded,
                color: ColorTheme.NEUTRAL_900,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              child: Text(
                "Daftar Akun",
                style: TextStyleTheme.HEADING_3.copyWith(
                  color: ColorTheme.TEXT_100,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: SpacingTheme.SPACING_2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun? ", style: TextStyleTheme.PARAGRAPH_5),
                InkWell(
                  onTap: () {
                    Get.offNamed(Routes.LOGIN);
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyleTheme.PARAGRAPH_4.copyWith(
                      color: ColorTheme.CRIMSON_500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SpacingTheme.SPACING_11),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SpacingTheme.SPACING_8,
              ),
              child: Column(
                spacing: SpacingTheme.SPACING_8,
                children: [
                  StaticDropdownTextField<Role>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                      ),
                      labelText: "Jenis User*",
                      filled: true,
                      fillColor: ColorTheme.NEUTRAL_100,
                      alignLabelWithHint: true,
                    ),
                    childWidget: (data) => Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: SpacingTheme.SPACING_8,
                        vertical: SpacingTheme.SPACING_4,
                      ),
                      child: Text(data.name, style: TextStyleTheme.PARAGRAPH_5),
                    ),
                    items: Role.values.toList(),
                    onSelectData: (role) {},
                    onSetTextFieldLabel: (role) {
                      return role.name;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                      ),
                      hintText: "Nama Lengkap",
                      filled: true,
                      fillColor: ColorTheme.NEUTRAL_100,
                      helperText: "Sesuai KTP",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:async_dropdown/async_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/education.dart';
import 'package:soul_doctor/app/domain/model/gender.dart';
import 'package:soul_doctor/app/domain/model/marital.dart';
import 'package:soul_doctor/app/domain/model/religion.dart';
import 'package:soul_doctor/app/helpers/validators.dart';
import 'package:soul_doctor/app/widgets/header/basic_app_bar.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../domain/model/role.dart';
import '../controllers/input_profile_controller.dart';

class InputProfileView extends GetView<InputProfileController> {
  const InputProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.currentProfileData.value.status == Status.loading ||
          controller.inputProfileStatus.value.status == Status.loading) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return Scaffold(
          appBar: BasicAppBar(title: "Data Diri"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SpacingTheme.SPACING_11),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpacingTheme.SPACING_8,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      spacing: SpacingTheme.SPACING_8,
                      children: [
                        Obx(
                          () => StaticDropdownTextField<Role>(
                            enabled:
                                controller
                                    .inputProfileSettings
                                    .initialProfile ==
                                null,
                            controller: controller.roleController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              labelText: "Jenis User*",
                              filled: true,
                              errorText: controller.roleErrorText.value,
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
                            items: Role.values.toList(),
                            onSelectData: controller.onChangeRoleValue,
                            onSetTextFieldLabel: (role) {
                              return role.name;
                            },
                          ),
                        ),
                        TextFormField(
                          controller: controller.fullnameController,
                          validator: (value) => Validators.onNotEmptyValidation(
                            value,
                            "Nama Lengkap",
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            hintText: "Nama Lengkap",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        TextFormField(
                          controller: controller.nicknameController,
                          validator: (value) => Validators.onNotEmptyValidation(
                            value,
                            "Nama Panggilan",
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            hintText: "Nama Panggilan",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        TextFormField(
                          controller: controller.nikController,
                          validator: (value) => Validators.onNotEmptyValidation(
                            value,
                            "NIK",
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            hintText: "Nik",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        TextFormField(
                          validator: (value) => Validators.onNotEmptyValidation(
                            value,
                            "Nomor Telepon",
                          ),
                          controller: controller.phoneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            hintText: "Nomor Telepon",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        TextFormField(
                          readOnly: true,
                          enabled: false,
                          controller: controller.emailController,
                          validator: Validators.onEmailValidation,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            hintText: "Email",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        TextFormField(
                          readOnly: true,
                          onTap: controller.onSelectDateBirth,
                          controller: controller.dateTimeController,
                          validator: (value) => Validators.onNotEmptyValidation(
                            value,
                            "Tanggal Lahir",
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            hintText: "Tanggal Lahir",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        Obx(
                          () => StaticDropdownTextField<Gender>(
                            controller: controller.genderController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              labelText: "Jenis Kelamin",
                              filled: true,
                              errorText: controller.genderErrorText.value,
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
                            items: Gender.values,
                            onSelectData: controller.onChangeGenderValue,
                            onSetTextFieldLabel: (gender) {
                              return gender.name;
                            },
                          ),
                        ),
                        Obx(
                          () => StaticDropdownTextField<Marital>(
                            controller: controller.maritalController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              labelText: "Status Perkawinan",
                              filled: true,
                              errorText: controller.maritalErrorText.value,
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
                            items: Marital.values,
                            onSelectData: controller.onChangeMaritalValue,
                            onSetTextFieldLabel: (marital) {
                              return marital.name;
                            },
                          ),
                        ),
                        Obx(
                          () => StaticDropdownTextField<Education>(
                            controller: controller.educationController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              labelText: "Pendidikan",
                              filled: true,
                              errorText: controller.educationErrorText.value,
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
                            items: Education.values,
                            onSelectData: controller.onChangeEducationValue,
                            onSetTextFieldLabel: (education) {
                              return education.name;
                            },
                          ),
                        ),
                        TextFormField(
                          controller: controller.jobController,
                          validator: (value) => Validators.onNotEmptyValidation(
                            value,
                            "Pekerjaan",
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            hintText: "Pekerjaan",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        Obx(
                          () => StaticDropdownTextField<Religion>(
                            controller: controller.religionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              labelText: "Agama",
                              filled: true,
                              errorText: controller.religionErrorText.value,
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
                            items: Religion.values,
                            onSelectData: controller.onChaneReligionValue,
                            onSetTextFieldLabel: (religion) {
                              return religion.name;
                            },
                          ),
                        ),
                        TextFormField(
                          controller: controller.addressController,
                          validator: (value) =>
                              Validators.onNotEmptyValidation(value, "Alamat"),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            hintText: "Alamat",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: SafeArea(
              child: FilledButton(
                onPressed:
                    controller.inputProfileSettings.initialProfile == null
                    ? controller.onCreateProfile
                    : controller.onUpdateProfile,
                child: Text(
                  controller.inputProfileSettings.initialProfile == null
                      ? "Tambah"
                      : "Update",
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}

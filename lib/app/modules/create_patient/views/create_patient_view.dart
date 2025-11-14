import 'package:async_dropdown/async_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/resource.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../domain/model/education.dart';
import '../../../domain/model/gender.dart';
import '../../../domain/model/marital.dart';
import '../../../domain/model/religion.dart';
import '../../../helpers/validators.dart';
import '../../../widgets/header/basic_app_bar.dart';
import '../controllers/create_patient_controller.dart';

class CreatePatientView extends GetView<CreatePatientController> {
  const CreatePatientView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.inputProfileStatus.value.status == Status.loading) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return Scaffold(
          appBar: BasicAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Tambah Pasien",
                    style: TextStyleTheme.HEADING_3.copyWith(
                      color: ColorTheme.TEXT_100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                          validator: (value) =>
                              Validators.onNumberValidation(value),
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
                onPressed: controller.onUpdateProfile,
                child: Text("Tambah Pasien"),
              ),
            ),
          ),
        );
      }
    });
  }
}

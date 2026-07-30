import 'package:amicons/amicons.dart';
import 'package:async_dropdown/async_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../common/resource.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../domain/model/patient.dart';
import '../../../helpers/validators.dart';
import '../controllers/add_edit_reminder_care_task_controller.dart';

class AddEditReminderCareTaskView
    extends GetView<AddEditReminderCareTaskController> {
  const AddEditReminderCareTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          controller.addEditReminderCareTaskState.value.status == Status.loading
          ? Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(
                title: Text(
                  'Tambah Tugas Perawatan',
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
                actions: [
                  if (controller.addEditReminderCalendarSettings.reminderId !=
                      null)
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Amicons.flaticon_trash_rounded,
                        color: ColorTheme.CRIMSON_500,
                      ),
                    ),
                ],
                automaticallyImplyLeading: false,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        AsyncDropdownTextField<Patient>(
                          childWidget: (data) => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(data.name),
                          ),
                          onSelectData: controller.onChangeSelectedPatient,
                          onSetTextFieldLabel: (selectedData) {
                            return selectedData.name;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            hintText: "Nama Pasien*",
                            errorText:
                                controller.selectedPatientErrorText.value,
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                          getItems: (String keyword) async {
                            return await controller.getPatient();
                          },
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                        TextFormField(
                          controller: controller.titleController,
                          validator: (value) =>
                              Validators.onNotEmptyValidation(value, "Judul"),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            labelText: "Judul*",
                            alignLabelWithHint: true,
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                        TextFormField(
                          controller: controller.descriptionController,
                          validator: (value) => Validators.onNotEmptyValidation(
                            value,
                            "Deskripsi",
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            labelText: "Deskripsi*",
                            alignLabelWithHint: true,
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                          maxLines: 5,
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                        TextFormField(
                          controller: controller.frequencyPerDayController,
                          validator: (value) => Validators.onIntValidation(
                            value,
                            "Frekuensi Per Hari",
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            labelText: "Frekuensi Per Hari*",
                            alignLabelWithHint: true,
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                        TextFormField(
                          readOnly: true,
                          controller: controller.dateTimeStartController,
                          validator: (value) => Validators.onNotEmptyValidation(
                            value,
                            "Tanggal Mulai",
                          ),
                          onTap: controller.onSelectStartDateTime,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            labelText: "Tanggal Mulai*",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                            suffixIcon: Icon(
                              Amicons.flaticon_calendar_rounded,
                              color: ColorTheme.NEUTRAL_700,
                            ),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                        TextFormField(
                          readOnly: true,
                          controller: controller.dateTimeEndController,
                          validator: (value) => Validators.onNotEmptyValidation(
                            value,
                            "Tanggal Berakhir",
                          ),
                          onTap: controller.onSelectEndDateTime,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                            ),
                            labelText: "Tanggal Berakhir*",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                            suffixIcon: Icon(
                              Amicons.flaticon_calendar_rounded,
                              color: ColorTheme.NEUTRAL_700,
                            ),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
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
                child: FilledButton(
                  onPressed: controller.onAddReminderCareTask,
                  child: Text(
                    "Tambah Tugas Perawatan",
                    style: TextStyleTheme.LABEL_1,
                  ),
                ),
              ),
            ),
    );
  }
}

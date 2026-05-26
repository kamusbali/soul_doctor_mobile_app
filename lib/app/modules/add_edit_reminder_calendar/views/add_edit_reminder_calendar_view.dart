import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/resource.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../helpers/validators.dart';
import '../controllers/add_edit_reminder_calendar_controller.dart';

class AddEditReminderCalendarView
    extends GetView<AddEditReminderCalendarController> {
  const AddEditReminderCalendarView({super.key});
  @override
  Widget build(BuildContext context) {
    return controller.addEditReminderCalendarState.value.status ==
            Status.loading
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: AppBar(
              title: Text(
                controller.addEditReminderCalendarSettings.calendarReminder ==
                        null
                    ? 'Tambah Pengingat'
                    : 'Edit Pengingat',
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
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
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
                        validator: (value) =>
                            Validators.onNotEmptyValidation(value, "Deskripsi"),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          labelText: "Deskripsi",
                          alignLabelWithHint: true,
                          filled: true,
                          fillColor: ColorTheme.NEUTRAL_100,
                        ),
                        maxLines: 5,
                      ),
                      SizedBox(height: SpacingTheme.SPACING_8),
                      TextFormField(
                        readOnly: true,
                        controller: controller.dateTimeController,
                        validator: (value) => Validators.onNotEmptyValidation(
                          value,
                          "Tanggal dan Waktu",
                        ),
                        onTap: controller.onSelectDateTime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          labelText: "Tanggal dan Waktu*",
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
                onPressed:
                    controller
                            .addEditReminderCalendarSettings
                            .calendarReminder ==
                        null
                    ? controller.onAddReminderCalendar
                    : controller.onEditReminderCalendar,
                child: Text("Tambah Pengingat", style: TextStyleTheme.LABEL_1),
              ),
            ),
          );
  }
}

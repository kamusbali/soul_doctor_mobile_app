import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../routes/app_pages.dart';
import '../../add_edit_reminder_calendar/settings/add_edit_reminder_calendar_settings.dart';
import '../controllers/reminder_calendar_controller.dart';

class ReminderCalendarView extends GetView<ReminderCalendarController> {
  const ReminderCalendarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reminder Calendar',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            Routes.ADD_EDIT_REMINDER_CALENDAR,
            arguments: AddEditReminderCalendarSettings(),
          )?.then((_) {
            controller.onInit();
          });
        },
        child: Icon(Amicons.flaticon_plus_rounded),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CalendarDatePicker(
              initialDate: controller.selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              onDateChanged: controller.onChangeDate,
            ),
            Obx(
              () => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: controller.currentSelectedReminderCalendar.isEmpty
                      ? Center(
                          child: Text('Tidak ada reminder untuk tanggal ini'),
                        )
                      : ListView.builder(
                          itemCount:
                              controller.currentSelectedReminderCalendar.length,
                          itemBuilder: (context, index) {
                            final reminder = controller
                                .currentSelectedReminderCalendar[index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(
                                  Routes.ADD_EDIT_REMINDER_CALENDAR,
                                  arguments: AddEditReminderCalendarSettings(
                                    calendarReminder: reminder,
                                  ),
                                )?.then((_) {
                                  controller.onInit();
                                });
                              },
                              leading: Checkbox(
                                value: reminder.isDoneDateTime.contains(
                                  DateTime(
                                    controller.selectedDate.year,
                                    controller.selectedDate.month,
                                    controller.selectedDate.day,
                                  ),
                                ),
                                onChanged: (value) => controller
                                    .onChangeReminderStatus(reminder, value),
                              ),
                              title: Text(
                                reminder.title,
                                style: TextStyle(
                                  decoration:
                                      reminder.isDoneDateTime.contains(
                                        DateTime(
                                          controller.selectedDate.year,
                                          controller.selectedDate.month,
                                          controller.selectedDate.day,
                                        ),
                                      )
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              subtitle: reminder.description != null
                                  ? Text(
                                      reminder.description!,
                                      style: TextStyle(
                                        decoration:
                                            reminder.isDoneDateTime.contains(
                                              DateTime(
                                                controller.selectedDate.year,
                                                controller.selectedDate.month,
                                                controller.selectedDate.day,
                                              ),
                                            )
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                      ),
                                    )
                                  : null,
                              trailing: Text(
                                "${reminder.dateTime.hour}:${reminder.dateTime.minute.toString().padLeft(2, '0')}",
                                style: TextStyle(
                                  decoration:
                                      reminder.isDoneDateTime.contains(
                                        DateTime(
                                          controller.selectedDate.year,
                                          controller.selectedDate.month,
                                          controller.selectedDate.day,
                                        ),
                                      )
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

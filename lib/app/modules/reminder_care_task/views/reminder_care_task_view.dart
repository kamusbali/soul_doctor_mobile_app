import 'package:accordion/accordion.dart';
import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/widgets/placeholder/placeholder_no_consultation.dart';

import '../../../common/resource.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/reminder_care_task_controller.dart';

class ReminderCareTaskView extends GetView<ReminderCareTaskController> {
  const ReminderCareTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reminder Tugas Perawatan',
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
      body: SafeArea(
        child: Obx(() {
          if (controller.reminderCalendar.value.status == Status.loading ||
              controller.markAsDoneReminderCareTaskState.value.status ==
                  Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.reminderCalendar.value.status == Status.success) {
            var reminderCareTask = controller.reminderCalendar.value.data;
            if (reminderCareTask == null || reminderCareTask.isEmpty) {
              return const Center(child: Text("Tidak ada data"));
            }
            return Accordion(
              children: reminderCareTask.map((task) {
                return AccordionSection(
                  contentVerticalPadding: 20,
                  header: Text(
                    task.title,
                    style: TextStyleTheme.BODY_2.copyWith(
                      color: ColorTheme.NEUTRAL_100,
                    ),
                  ),
                  headerBackgroundColor: ColorTheme.CRIMSON_500,
                  headerPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  content: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var e = task.details[index];
                      return ListTile(
                        title: Text(
                          "Tugas Ke-${e.order.toString()} ${task.title}",
                        ),
                        trailing: FilledButton(
                          onPressed: () {
                            controller.markAsDoneReminderCareTask(e.id);
                          },
                          child: Text("Tandai Selesai"),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(color: ColorTheme.CRIMSON_500),
                    itemCount: task.details.length,
                  ),
                );
              }).toList(),
            );
          }
          return LayoutBuilder(
            builder: (context, constraints) {
              return RefreshIndicator(
                onRefresh: () async {
                  controller.onInit();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      children: [
                        PlaceholderNoData(
                          title: "Belom ada reminder care task",
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

import 'package:amicons/amicons.dart';
import 'package:async_dropdown/async_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/volunteer.dart';
import 'package:soul_doctor/app/helpers/validators.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/visit_schedule_form_controller.dart';

class VisitScheduleFormView extends GetView<VisitScheduleFormController> {
  const VisitScheduleFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.assignVolunteerState.value.status) {
        case Status.loading:
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        default:
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Form Visit',
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
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      if (controller
                              .visitScheduleFormSettings
                              .visitorRejection !=
                          null) ...[
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            "Volunteer Sebelumnya",
                            style: TextStyleTheme.LABEL_3,
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_2),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            controller
                                .visitScheduleFormSettings
                                .visitorRejection!
                                .name,
                            style: TextStyleTheme.LABEL_3,
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            "Alasan Ditolak",
                            style: TextStyleTheme.LABEL_3,
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_2),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            controller
                                .visitScheduleFormSettings
                                .visitorRejection!
                                .reason,
                            style: TextStyleTheme.LABEL_3,
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                      ],
                      Obx(
                        () => AsyncDropdownTextField<Volunteer>(
                          childWidget: (data) => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(data.name),
                          ),
                          onSelectData: controller.onChangeSelectedVolunteer,
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
                            hintText: "Volunteer",
                            errorText:
                                controller.selectedVolunteerErrorText.value,
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                          getItems: (String keyword) async {
                            return await controller.getVolunteer();
                          },
                        ),
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
                      //     ),
                      //     labelText: "Volunteer",
                      //     alignLabelWithHint: true,
                      //     filled: true,
                      //     fillColor: ColorTheme.NEUTRAL_100,
                      //   ),
                      // ),
                      SizedBox(height: SpacingTheme.SPACING_8),
                      TextFormField(
                        controller: controller.notesController,
                        validator: (value) =>
                            Validators.onNotEmptyValidation(value, "Catatan"),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorTheme.NEUTRAL_500,
                            ),
                          ),
                          labelText: "Catatan",
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
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsetsGeometry.only(
                left: SpacingTheme.SPACING_8,
                right: SpacingTheme.SPACING_8,
                bottom: SpacingTheme.SPACING_14,
                top: SpacingTheme.SPACING_8,
              ),
              child: FilledButton(
                onPressed: controller.onAssignVisitToVolunteer,
                child: Text("Buat Jadwal Visit", style: TextStyleTheme.LABEL_1),
              ),
            ),
          );
      }
    });
  }
}

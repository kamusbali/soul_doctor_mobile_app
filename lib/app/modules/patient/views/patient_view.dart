import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/modules/wrapper/controllers/wrapper_controller.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
import 'package:soul_doctor/app/widgets/card/card_patient.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/patient_controller.dart';

class PatientView extends GetView<PatientController> {
  final WrapperController _wrapperController = Get.find();

  PatientView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.SURFACE,
        elevation: 0,
        title: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SpacingTheme.SPACING_5),
              borderSide: BorderSide(color: ColorTheme.NEUTRAL_500),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SpacingTheme.SPACING_5),
              borderSide: const BorderSide(color: ColorTheme.NEUTRAL_500),
            ),
            isDense: true,
            prefixIcon: Icon(Amicons.flaticon_search_rounded),
            hintText: "Cari",
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingTheme.SPACING_4,
            ),
            child: IconButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    width: Get.width,
                    height: 700,
                    padding: EdgeInsets.only(
                      left: SpacingTheme.SPACING_8,
                      right: SpacingTheme.SPACING_8,
                      top: SpacingTheme.SPACING_8,
                      bottom: SpacingTheme.SPACING_13,
                    ),
                    decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 6,
                          decoration: BoxDecoration(
                            color: ColorTheme.NEUTRAL_500,
                            borderRadius: BorderRadius.circular(10000),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            "Filter",
                            style: TextStyleTheme.BODY_1.copyWith(
                              color: ColorTheme.TEXT_100,
                            ),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_6),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Konsultasi Terdahulu",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.CRIMSON_500,
                                    ),
                                  ),
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Konsultasi Mendatang",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.CRIMSON_500,
                                    ),
                                  ),
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Sedang Konsultasi",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.CRIMSON_500,
                                    ),
                                  ),
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Dapat Obat",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.TEXT_PLACEHOLDER,
                                    ),
                                  ),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Melakukan Terapi",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.TEXT_PLACEHOLDER,
                                    ),
                                  ),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                CheckboxListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                    "Visit",
                                    style: TextStyleTheme.LABEL_1.copyWith(
                                      color: ColorTheme.TEXT_PLACEHOLDER,
                                    ),
                                  ),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_6),
                        SizedBox(
                          width: Get.width,
                          child: FilledButton(
                            onPressed: () {},
                            child: Text(
                              "Terapkan",
                              style: TextStyleTheme.LABEL_1.copyWith(
                                color: ColorTheme.NEUTRAL_100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(
                Amicons.flaticon_filter_rounded,
                color: ColorTheme.CRIMSON_500,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingTheme.SPACING_8),
        child: SingleChildScrollView(
          child: Obx(() {
            switch (controller.patient.value.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.success:
                return Column(
                  spacing: SpacingTheme.SPACING_4,
                  children:
                      controller.patient.value.data
                          ?.map(
                            (e) => CardPatient(
                              name: e.name,
                              age: e.summary.age,
                              onTap: () {
                                if (_wrapperController.user?.role ==
                                    Role.caregiver) {
                                  Get.toNamed(Routes.PATIENT_HISTORY);
                                  return;
                                }
                                if (_wrapperController.user?.role ==
                                        Role.volunteer ||
                                    _wrapperController.user?.role ==
                                        Role.doctor) {
                                  Get.toNamed(Routes.PATIENT_DETAIL_HISTORY);
                                  return;
                                }
                              },
                            ),
                          )
                          .toList() ??
                      [],
                  // children: List.generate(
                  //   10,
                  //   (index) => CardPatient(
                  //     name: "Anak Agung Ngurah Putra Tole Armstrong",
                  //     age: 69,
                  //     onTap: () {
                  //       if (_wrapperController.user?.role == Role.caregiver) {
                  //         Get.toNamed(Routes.PATIENT_HISTORY);
                  //         return;
                  //       }
                  //       if (_wrapperController.user?.role == Role.volunteer ||
                  //           _wrapperController.user?.role == Role.doctor) {
                  //         Get.toNamed(Routes.PATIENT_DETAIL_HISTORY);
                  //         return;
                  //       }
                  //     },
                  //   ),
                  // ),
                );
              default:
                return Placeholder();
            }
          }),
        ),
      ),
    );
  }
}

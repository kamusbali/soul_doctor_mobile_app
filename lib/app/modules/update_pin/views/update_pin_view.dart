import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../helpers/validators.dart';
import '../../../widgets/header/basic_app_bar.dart';
import '../controllers/update_pin_controller.dart';

class UpdatePinView extends GetView<UpdatePinController> {
  const UpdatePinView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.updatePinStatus.value.status == Status.loading) {
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
                    "Update Pin",
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
                        Obx(
                          () => TextFormField(
                            controller: controller.oldPinController,
                            validator: (value) =>
                                Validators.onPinValidation(value),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            obscureText: !controller.isOldPinVisible.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              hintText: "Pin Lama",
                              filled: true,
                              fillColor: ColorTheme.NEUTRAL_100,
                              suffixIcon: InkWell(
                                onTap: controller.onChangeOldPinVisibility,
                                borderRadius: BorderRadius.circular(99),
                                child: controller.isNewPinVisible.value
                                    ? Icon(Amicons.vuesax_eye_slash)
                                    : Icon(Amicons.vuesax_eye),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => TextFormField(
                            controller: controller.newPinController,
                            validator: (value) =>
                                Validators.onPinValidation(value),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            obscureText: !controller.isNewPinVisible.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              hintText: "Pin Baru",
                              filled: true,
                              fillColor: ColorTheme.NEUTRAL_100,
                              suffixIcon: InkWell(
                                onTap: controller.onChangePinVisibility,
                                borderRadius: BorderRadius.circular(99),
                                child: controller.isNewPinVisible.value
                                    ? Icon(Amicons.vuesax_eye_slash)
                                    : Icon(Amicons.vuesax_eye),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => TextFormField(
                            controller: controller.newPinRepeatController,
                            validator: (value) =>
                                Validators.onPinRepeatValidation(
                                  value,
                                  controller.newPinController.text,
                                ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            obscureText:
                                !controller.isNewPinRepeatVisible.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              hintText: "Ulangi Pin Baru",
                              filled: true,
                              fillColor: ColorTheme.NEUTRAL_100,
                              suffixIcon: InkWell(
                                onTap: controller.onChangePinRepeatVisibility,
                                borderRadius: BorderRadius.circular(99),
                                child: controller.isNewPinRepeatVisible.value
                                    ? Icon(Amicons.vuesax_eye_slash)
                                    : Icon(Amicons.vuesax_eye),
                              ),
                            ),
                          ),
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
                onPressed: controller.onUpdatePin,
                child: Text("Buat Pin"),
              ),
            ),
          ),
        );
      }
    });
  }
}

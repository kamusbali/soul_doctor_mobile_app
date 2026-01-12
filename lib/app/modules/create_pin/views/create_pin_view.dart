import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/widgets/header/basic_app_bar.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../helpers/validators.dart';
import '../controllers/create_pin_controller.dart';

class CreatePinView extends GetView<CreatePinController> {
  const CreatePinView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
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
                    "Buat Pin",
                    style: TextStyleTheme.HEADING_3.copyWith(
                      color: ColorTheme.TEXT_100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: SpacingTheme.SPACING_2),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Buatlah pin anda, pin yang anda buat harus angka dengan panjang 6 karakter",
                    style: TextStyleTheme.PARAGRAPH_5,
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
                            controller: controller.pinController,
                            validator: (value) =>
                                Validators.onPinValidation(value),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            obscureText: !controller.isPinVisible.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              hintText: "Pin",
                              filled: true,
                              fillColor: ColorTheme.NEUTRAL_100,
                              suffixIcon: InkWell(
                                onTap: controller.onChangePinVisibility,
                                borderRadius: BorderRadius.circular(99),
                                child: controller.isPinVisible.value
                                    ? Icon(Amicons.vuesax_eye_slash)
                                    : Icon(Amicons.vuesax_eye),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => TextFormField(
                            controller: controller.pinRepeatController,
                            validator: (value) =>
                                Validators.onPinRepeatValidation(
                                  value,
                                  controller.pinController.text,
                                ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            obscureText: !controller.isPinRepeatVisible.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                              ),
                              hintText: "Ulangi Pin",
                              filled: true,
                              fillColor: ColorTheme.NEUTRAL_100,
                              suffixIcon: InkWell(
                                onTap: controller.onChangePinRepeatVisibility,
                                borderRadius: BorderRadius.circular(99),
                                child: controller.isPinRepeatVisible.value
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
                onPressed: controller.onCreatePin,
                child: Text("Buat Pin"),
              ),
            ),
          ),
        );
      }
    });
  }
}

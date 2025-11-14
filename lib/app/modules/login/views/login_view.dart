import 'package:amicons/amicons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
import 'package:soul_doctor/app/widgets/header/basic_app_bar.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loginStatus.value.status == Status.loading) {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      } else {
        return Scaffold(
          appBar: BasicAppBar(title: ""),
          body: SizedBox(
            width: Get.width,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpacingTheme.SPACING_8,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Text("Masukkan akun!", style: TextStyleTheme.HEADING_3),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "Belum punya akun? "),
                              TextSpan(
                                text: "Daftar",
                                style: TextStyleTheme.PARAGRAPH_4.copyWith(
                                  color: ColorTheme.CRIMSON_500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offNamed(Routes.REGISTER);
                                  },
                              ),
                            ],
                            style: TextStyleTheme.PARAGRAPH_5.copyWith(
                              color: ColorTheme.TEXT_100,
                            ),
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_11),
                        TextFormField(
                          controller: controller.phoneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.NEUTRAL_500,
                              ),
                              borderRadius: BorderRadius.circular(
                                SpacingTheme.SPACING_5,
                              ),
                            ),
                            hintText: "Nomor Telp (+62xxxx)",
                            filled: true,
                            fillColor: ColorTheme.NEUTRAL_100,
                          ),
                        ),
                        SizedBox(height: SpacingTheme.SPACING_8),
                        Obx(
                          () => TextFormField(
                            controller: controller.pinController,
                            obscureText: !controller.isPinVisible.value,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.NEUTRAL_500,
                                ),
                                borderRadius: BorderRadius.circular(
                                  SpacingTheme.SPACING_5,
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
                        SizedBox(height: SpacingTheme.SPACING_8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Lupa pin?",
                                style: TextStyleTheme.PARAGRAPH_4.copyWith(
                                  color: ColorTheme.CRIMSON_500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: SafeArea(
              child: FilledButton(
                onPressed: controller.onLogin,
                child: Text("Masuk"),
              ),
            ),
          ),
        );
      }
    });
  }
}

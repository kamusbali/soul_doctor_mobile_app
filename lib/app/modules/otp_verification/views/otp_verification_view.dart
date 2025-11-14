import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';
import 'package:soul_doctor/app/helpers/date_time_utils.dart';
import 'package:soul_doctor/app/helpers/string_utils.dart';
import 'package:soul_doctor/app/widgets/header/basic_app_bar.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.verificationStatus.value.status) {
        case Status.loading:
          return Scaffold(body: Center(child: CircularProgressIndicator()));

        default:
          return Scaffold(
            appBar: BasicAppBar(),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          "Verifikasi akun",
                          style: TextStyleTheme.HEADING_3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          "Masukkan kode OTP yang telah dikirimkan",
                          style: TextStyleTheme.PARAGRAPH_5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "ke email"),
                              TextSpan(
                                text: StringUtils.maskPhoneNumber(
                                  controller
                                      .otpVerificationSettings
                                      .phoneNumber,
                                ),
                              ),
                            ],
                            style: TextStyleTheme.PARAGRAPH_5.copyWith(
                              color: ColorTheme.TEXT_100,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: SpacingTheme.SPACING_11),
                      Pinput(
                        controller: controller.otpController,
                        onChanged: controller.onChangedOtpValue,
                        length: 6,
                        defaultPinTheme: PinTheme(
                          width: 50,
                          height: 60,
                          decoration: BoxDecoration(
                            color: ColorTheme.NEUTRAL_100,
                            border: Border.all(color: ColorTheme.NEUTRAL_500),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(height: SpacingTheme.SPACING_11),
                      Obx(
                        () => RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "Belum menerima kode? "),
                              TextSpan(
                                text:
                                    "Kirim Ulang ${DateTimeUtils.formatSecondsToTime(controller.count.value)}",
                                style: TextStyleTheme.PARAGRAPH_4,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = controller.isUserCanResend.value
                                      ? () {
                                          controller.startTimer();
                                        }
                                      : null,
                              ),
                            ],
                            style: TextStyleTheme.PARAGRAPH_5.copyWith(
                              color: ColorTheme.TEXT_100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: SafeArea(
                child: Obx(
                  () => FilledButton(
                    onPressed: !controller.isCanVerification.value
                        ? null
                        : controller.onVerifOtp,
                    child: Text("Verifikasi"),
                  ),
                ),
              ),
            ),
          );
      }
    });
  }
}

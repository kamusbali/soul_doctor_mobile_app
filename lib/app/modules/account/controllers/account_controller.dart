import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/daily_report_use_cases/daily_report_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/patient_use_cases/patient_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/profile_use_cases/profile_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/resource.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../domain/model/compact_user.dart';
import '../../../domain/model/role.dart';
import '../../../domain/model/session_data.dart';
import '../../../routes/app_pages.dart';

class AccountController extends GetxController {
  final AuthUseCases _authUseCases;
  final ProfileUseCases _profileUseCases;
  final DailyReportUseCases _dailyReportUseCases;
  final PatientUseCases _patientUseCases;

  AccountController(
    this._authUseCases,
    this._profileUseCases,
    this._dailyReportUseCases,
    this._patientUseCases,
  );

  var version = "".obs;

  var user = Resource<SessionData>.none().obs;
  var compactUser = Resource<CompactUser>.none().obs;

  @override
  void onInit() {
    super.onInit();

    getAppInfo();
    onGetProfileData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }

  void onGetProfileData() async {
    var sessionData = await _authUseCases.getSessionDataUseCases.execute();

    if (sessionData == null) {
      user.value = Resource.none();
      return;
    }

    user.value = Resource.success(sessionData);

    if (user.value.data?.role == Role.patient ||
        user.value.data?.role == Role.caregiver) {
      var response = await _profileUseCases.getCompactProfileUseCase.execute();

      response.fold(
        (failure) {
          UiFeedbackUtils.showSnackbar("Error", failure.message);
          compactUser.value = Resource.error(failure.message);
        },
        (success) {
          if (success == null) {
            UiFeedbackUtils.showSnackbar("Error", "Data kosong");
            compactUser.value = Resource.error("Data kosong");
            return;
          }

          compactUser.value = Resource.success(success);
        },
      );
    }
  }

  void onLogout() async {
    UiFeedbackUtils.showDialog(
      title: "Keluar",
      body: "Apakah anda yakin ingin keluar?",
      primaryButtonText: "Iya",
      onPrimaryPressed: () async {
        await _authUseCases.logoutUseCase.execute();
        Get.back();
        Get.offAllNamed(Routes.GUEST_WRAPPER);
      },
      secondaryButtonText: "Tidak",
      onSecondaryPressed: () {
        Get.back();
      },
      barrierDismissible: false,
    );
  }

  void onNeedHelp() async {
    var helpPhone = "+62361467553";
    UiFeedbackUtils.showDialog(
      title: "Butuh Bantuan?",
      body:
          "Untuk permohonan bantuan silahkan menghubungi Suryani Institute for Mental Health ($helpPhone)",
      primaryButtonText: "Telp",
      onPrimaryPressed: () async {
        await _launchUrl("tel:$helpPhone");
        Get.back();
      },
      secondaryButtonText: "Salin Nomor",
      onSecondaryPressed: () async {
        await Clipboard.setData(ClipboardData(text: helpPhone));
        UiFeedbackUtils.showSnackbar(
          "Berhasil",
          "Berhasil menyalin nomor telp",
        );
        Get.back();
      },
    );
  }

  Future<void> onCopyDailyReport() async {
    if (compactUser.value.data?.role == Role.patient) {
      var sessionDataResponse = await _authUseCases.getSessionDataUseCases
          .execute();

      var response = await _dailyReportUseCases
          .markdownPatientDailyReportUseCase
          .execute(patientId: sessionDataResponse?.id ?? "");

      response.fold(
        (failure) {
          UiFeedbackUtils.showSnackbar("Error", failure.message);
        },
        (markdown) async {
          await Clipboard.setData(ClipboardData(text: markdown));
          UiFeedbackUtils.showSnackbar(
            "Berhasil",
            "Laporan harian berhasil disalin dalam format markdown",
          );
        },
      );
      return;
    }
    var patientList = await _patientUseCases.getPatientUseCase.execute();

    patientList.fold(
      (failure) {
        UiFeedbackUtils.showSnackbar("Error", failure.message);
      },
      (success) {
        Get.bottomSheet(
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: ColorTheme.SURFACE,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SpacingTheme.SPACING_4,
                children: [
                  Text("Pilih Pasien", style: TextStyleTheme.BODY_2),
                  SizedBox(height: SpacingTheme.SPACING_4),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: success
                        .map(
                          (e) => InkWell(
                            onTap: () async {
                              var response = await _dailyReportUseCases
                                  .markdownPatientDailyReportUseCase
                                  .execute(patientId: e.id);

                              response.fold(
                                (failure) {
                                  UiFeedbackUtils.showSnackbar(
                                    "Error",
                                    failure.message,
                                  );
                                },
                                (markdown) async {
                                  await Clipboard.setData(
                                    ClipboardData(text: markdown),
                                  );
                                  UiFeedbackUtils.showSnackbar(
                                    "Berhasil",
                                    "Laporan harian berhasil disalin dalam format markdown",
                                  );
                                  Get.back();
                                },
                              );
                              Get.back();
                            },
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: ColorTheme.NEUTRAL_100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(e.name, style: TextStyleTheme.BODY_2),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          isScrollControlled: true,
        );
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        UiFeedbackUtils.showSnackbar("Error", "Tidak dapat mengarahkan link");
      }
    } on PlatformException {
      UiFeedbackUtils.showSnackbar("Error", "Platform anda tidak mendukung!");
    }
  }
}

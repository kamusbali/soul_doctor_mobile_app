import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/profile_use_cases/profile_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/resource.dart';
import '../../../domain/model/compact_user.dart';
import '../../../domain/model/role.dart';
import '../../../domain/model/session_data.dart';
import '../../../routes/app_pages.dart';

class AccountController extends GetxController {
  final AuthUseCases _authUseCases;
  final ProfileUseCases _profileUseCases;

  AccountController(this._authUseCases, this._profileUseCases);

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

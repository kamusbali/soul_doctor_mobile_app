import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/wrapper/controllers/wrapper_controller.dart';

class AccountController extends GetxController {
  var version = "".obs;

  final AuthUseCases _authUseCases;

  AccountController(this._authUseCases);

  late WrapperController wrapperController;

  @override
  void onInit() {
    super.onInit();

    wrapperController = Get.find<WrapperController>();

    getAppInfo();
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

  void onLogout() async {
    UiFeedbackUtils.showDialog(
      title: "Keluar",
      body: "Apakah anda yakin ingin keluar?",
      primaryButtonText: "Iya",
      onPrimaryPressed: () async {
        await _authUseCases.logoutUseCase.execute();
        wrapperController.onRefreshPage();
        wrapperController.onChangeTab(0);
        Get.back();
      },
      secondaryButtonText: "Tidak",
      onSecondaryPressed: () {
        Get.back();
      },
      barrierDismissible: false,
    );
  }
}

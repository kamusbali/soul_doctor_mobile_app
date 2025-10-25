import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


class AccountController extends GetxController {
  var version = "".obs;

  @override
  void onInit() {
    super.onInit();
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
}

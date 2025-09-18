import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../common/constant/dummy.dart';
import '../../../domain/model/role.dart';
import '../../../domain/model/user_data.dart';

class AccountController extends GetxController {
  var version = "".obs;

  var isAuth = true;

  UserData? user;

  @override
  void onInit() {
    super.onInit();
    getAppInfo();

    user = UserData(
      name: "Anak Agung Ngurah Putra Tole Armstrong",
      role: Role.caregiver,
      image: Dummy.photoProfile(),
    );
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

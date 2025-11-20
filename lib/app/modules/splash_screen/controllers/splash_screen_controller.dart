import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';

class SplashScreenController extends GetxController {
  final AuthUseCases _authUseCases;

  SplashScreenController(this._authUseCases);

  SessionData? sessionData;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onGetSessionData() async {
    var response = await _authUseCases.getSessionDataUseCases.execute();
    sessionData = response;
  }
}

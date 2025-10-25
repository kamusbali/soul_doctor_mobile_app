import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/profile.dart';
import 'package:soul_doctor/app/domain/use_case/profile_use_cases/profile_use_cases.dart';

class AccountSettingController extends GetxController {
  final ProfileUseCases _profileUseCases;

  AccountSettingController(this._profileUseCases);

  final profile = Resource<Profile>.none().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProfile() async {
    profile.value = Resource.loading();

    var response = await _profileUseCases.getProfileUseCase.execute();

    response.fold(
      (failure) {
        profile.value = Resource.error(failure.message);
        print(failure.message);
      },
      (succes) {
        profile.value = Resource.success(succes);
      },
    );
  }
}

import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/modules/doctor_wrapper/controllers/doctor_wrapper_controller.dart';

import '../../../common/resource.dart';
import '../../../core/error/error_type.dart';
import '../../../domain/model/consultation.dart';
import '../../../domain/model/session_data.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';

class DoctorHomeController extends GetxController {
  final AuthUseCases _authUseCases;
  final ConsultationUseCases _consultationUseCases;

  DoctorHomeController(this._authUseCases, this._consultationUseCases);

  var user = Resource<SessionData>.none().obs;
  final consultation = Resource<List<Consultation>>.none().obs;

  final DoctorWrapperController doctorWrapperController = Get.find();

  @override
  void onInit() {
    super.onInit();
    onGetProfileData();
    onGetRecentConsultation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onGetProfileData() async {
    var sessionData = await _authUseCases.getSessionDataUseCases.execute();

    if (sessionData == null) {
      user.value = Resource.none();
      return;
    }

    user.value = Resource.success(sessionData);
  }

  void onGetRecentConsultation() async {
    consultation.value = Resource.loading();
    var response = await _consultationUseCases.getHomeConsultation.execute(
      role: user.value.data?.role ?? Role.doctor,
    );

    response.fold(
      (failure) {
        if (failure.errorType == ErrorType.sessionExpired) {
          UiFeedbackUtils.showDialog(
            title: "Sesi Login Kadaluarsa",
            body: "Silahkan login kembali untuk dapat mengakses fitur",
            primaryButtonText: "Okay",
            onPrimaryPressed: () async {
              await _authUseCases.logoutUseCase.execute();
              Get.offAllNamed(Routes.GUEST_WRAPPER);
            },
          );
          consultation.value = Resource.error(failure.message);
          return;
        }
        print("Here");
        UiFeedbackUtils.showDialog(
          title: "Terjadi Kesalahan",
          body: failure.message,
          primaryButtonText: "Okay",
          onPrimaryPressed: () {
            Get.back();
          },
        );
        consultation.value = Resource.error(failure.message);
      },
      (success) {
        if (success.isEmpty) {
          consultation.value = Resource.empty();
          return;
        }
        consultation.value = Resource.success(success);
      },
    );
  }
}

import 'package:get/get.dart';
import 'package:soul_doctor/app/core/error/error_type.dart';
import 'package:soul_doctor/app/domain/model/consultation.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../common/resource.dart';
import '../../wrapper/controllers/wrapper_controller.dart';

class UserHomeController extends GetxController {
  final ConsultationUseCases _consultationUseCases;
  final AuthUseCases _authUseCases;

  final WrapperController wrapperController = Get.find();

  UserHomeController(this._consultationUseCases, this._authUseCases);

  final consultation = Resource<List<Consultation>>.none().obs;
  var isAuth = false;

  @override
  void onInit() {
    super.onInit();

    getConsultationData();
    getSessionStatus();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getConsultationData() async {
    var data = await _consultationUseCases.getHomeConsultation.execute(
      state: ConsultationStatus.scheduled,
    );

    data.fold(
      (failure) {
        if (failure.errorType == ErrorType.sessionExpired) {
          UiFeedbackUtils.showDialog(
            title: "Sesi Login Kadaluarsa",
            body: "Silahkan login kembali untuk dapat mengakses fitur",
            primaryButtonText: "Okay",
            onPrimaryPressed: () async {
              await _authUseCases.logoutUseCase.execute();
              Get.offAllNamed(Routes.WRAPPER);
            },
          );
          consultation.value = Resource.error(failure.message);
          return;
        }

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
        consultation.value = Resource.success(success);
      },
    );
  }

  void getSessionStatus() async {
    var data = await _authUseCases.getSessionStatusUseCase.execute();

    isAuth = data;
  }
}

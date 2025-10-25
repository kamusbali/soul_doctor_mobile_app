import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/compact_consultation_detail.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';

import '../../../core/error/error_type.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';

class DetailConsultationController extends GetxController {
  final AuthUseCases _authUseCases;
  final ConsultationUseCases _consultationUseCases;

  DetailConsultationController(this._authUseCases, this._consultationUseCases);

  final String id = Get.arguments;

  final consultationDetail = Resource<CompactConsultationDetail>.none().obs;
  SessionData? sessionData;

  @override
  void onInit() {
    super.onInit();
    onGetDetailConsultation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onGetDetailConsultation() async {
    consultationDetail.value = Resource.loading();
    var data = await _consultationUseCases.getCompactConsultationDetailUseCase
        .execute(id);

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
          consultationDetail.value = Resource.error(failure.message);
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
        consultationDetail.value = Resource.error(failure.message);
      },
      (success) {
        consultationDetail.value = Resource.success(success);
      },
    );
  }

  void onGetSessionData() async {
    sessionData = await _authUseCases.getSessionDataUseCases.execute();
  }
}

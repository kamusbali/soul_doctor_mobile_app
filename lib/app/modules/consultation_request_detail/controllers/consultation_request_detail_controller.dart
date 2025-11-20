import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/consultation_detail.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/modules/consultation_request_detail/settings/consultation_request_detail_settings.dart';

import '../../../core/error/error_type.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';

class ConsultationRequestDetailController extends GetxController {
  final ConsultationUseCases _consultationUseCases;
  final AuthUseCases _authUseCases;

  ConsultationRequestDetailController(
    this._consultationUseCases,
    this._authUseCases,
  );

  ConsultationRequestDetailSettings consultationRequestDetailSettings =
      Get.arguments;

  var consultationDetail = Resource<ConsultationDetail>.none().obs;

  @override
  void onInit() {
    super.onInit();
    onGetConsultationData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onGetConsultationData() async {
    consultationDetail.value = Resource.loading();
    var response = await _consultationUseCases.getConsultationDetailUseCase
        .execute(consultationRequestDetailSettings.id);

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
}

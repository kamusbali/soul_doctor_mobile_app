import 'package:get/get.dart';
import 'package:soul_doctor/app/core/error/error_type.dart';
import 'package:soul_doctor/app/core/infrastructure/auth/claims_token_service.dart';
import 'package:soul_doctor/app/domain/model/consultation.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../common/resource.dart';
import '../../../domain/model/session_data.dart';

class UserHomeController extends GetxController {
  final ConsultationUseCases _consultationUseCases;
  final AuthUseCases _authUseCases;
  final ClaimsTokenService _claimsTokenService = ClaimsTokenService.instance;

  UserHomeController(this._consultationUseCases, this._authUseCases);

  var user = Resource<SessionData?>.none().obs;

  final consultation = Resource<List<Consultation>>.none().obs;


  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  void onRefresh() async {
    await getSessionStatus();
    if (user.value.data != null) {
      getConsultationData();
    }
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
    consultation.value = Resource.loading();
    var sessionData = await _claimsTokenService.getSessionData();

    if (sessionData == null) {
      return;
    }

    var data = await _consultationUseCases.getHomeConsultation.execute(
      role: sessionData.role,
      patientId: sessionData.role == Role.patient ? sessionData.id : null,
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

  Future<void> getSessionStatus() async {
    var data = await _authUseCases.getSessionDataUseCases.execute();

    user.value = Resource.success(data);
  }
}

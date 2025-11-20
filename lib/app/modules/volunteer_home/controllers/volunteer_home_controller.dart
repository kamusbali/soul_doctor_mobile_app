import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/core/error/error_type.dart';
import 'package:soul_doctor/app/domain/model/consultation.dart';
import 'package:soul_doctor/app/domain/model/consultation_status.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/modules/volunteer_wrapper/controllers/volunteer_wrapper_controller.dart';

import '../../../domain/model/session_data.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../../../routes/app_pages.dart';

class VolunteerHomeController extends GetxController {
  final ConsultationUseCases _consultationUseCases;
  final AuthUseCases _authUseCases;

  VolunteerHomeController(this._consultationUseCases, this._authUseCases);

  final VolunteerWrapperController volunteerWrapperController = Get.find();

  var upcomingVisitState = Resource<List<Consultation>>.none().obs;
  var visitRequestState = Resource<List<Consultation>>.none().obs;

  var user = Resource<SessionData>.none().obs;

  @override
  void onInit() {
    super.onInit();
    onGetProfileData();
    onGetVisitRequest();
    onGetUpcomingVisit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onGetUpcomingVisit() async {
    upcomingVisitState.value = Resource.loading();
    var response = await _consultationUseCases.getConsultationUseCase.execute(
      state: ConsultationStatus.scheduled,
      pp: 5,
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
          upcomingVisitState.value = Resource.error(failure.message);
          return;
        }
        if (Get.isDialogOpen != true) {
          UiFeedbackUtils.showDialog(
            title: "Terjadi Kesalahan",
            body: failure.message,
            primaryButtonText: "Okay",
            onPrimaryPressed: () {
              Get.back();
            },
          );
        }

        upcomingVisitState.value = Resource.error(failure.message);
      },
      (success) {
        if (success.data.isEmpty) {
          upcomingVisitState.value = Resource.empty();
          return;
        }
        upcomingVisitState.value = Resource.success(success.data);
      },
    );
  }

  void onGetProfileData() async {
    var sessionData = await _authUseCases.getSessionDataUseCases.execute();

    if (sessionData == null) {
      user.value = Resource.none();
      return;
    }

    user.value = Resource.success(sessionData);
  }

  void onGetVisitRequest() async {
    visitRequestState.value = Resource.loading();
    var response = await _consultationUseCases.getConsultationUseCase.execute(
      state: ConsultationStatus.waitingVolunteer,
      pp: 5,
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
          visitRequestState.value = Resource.error(failure.message);
          return;
        }

        if (Get.isDialogOpen != true) {
          UiFeedbackUtils.showDialog(
            title: "Terjadi Kesalahan",
            body: failure.message,
            primaryButtonText: "Okay",
            onPrimaryPressed: () {
              Get.back();
            },
          );
        }
        visitRequestState.value = Resource.error(failure.message);
      },
      (success) {
        if (success.data.isEmpty) {
          visitRequestState.value = Resource.empty();
          return;
        }
        visitRequestState.value = Resource.success(success.data);
      },
    );
  }
}

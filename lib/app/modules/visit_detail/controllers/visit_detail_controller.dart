import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/consultation_detail.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/visit_detail/settings/visit_detail_settings.dart';

class VisitDetailController extends GetxController {
  final ConsultationUseCases _consultationUseCases;

  VisitDetailController(this._consultationUseCases);

  VisitDetailSettings visitDetailSettings = Get.arguments;

  var visitDataStatus = Resource<ConsultationDetail>.none().obs;

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

  void onGetVisitData() async {
    visitDataStatus.value = Resource.loading();
    var response = await _consultationUseCases.getConsultationDetailUseCase
        .execute(visitDetailSettings.id);

    response.fold(
      (failure) {
        UiFeedbackUtils.showSnackbar("Terjadi kesalahan", failure.message);
      },
      (success) {
        visitDataStatus.value = Resource.success(success);
      },
    );
  }
}

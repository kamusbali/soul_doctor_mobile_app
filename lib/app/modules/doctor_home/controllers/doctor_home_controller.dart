import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/consultation_use_cases/consultation_use_cases.dart';

import '../../wrapper/controllers/wrapper_controller.dart';

class DoctorHomeController extends GetxController {
  final AuthUseCases _authUseCases;
  final ConsultationUseCases _consultationUseCases;

  DoctorHomeController(this._authUseCases, this._consultationUseCases);

  final WrapperController wrapperController = Get.find();

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

  void onGetRecentConsultation (){
    
  }
}

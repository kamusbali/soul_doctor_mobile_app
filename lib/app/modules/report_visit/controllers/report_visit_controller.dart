import 'package:get/get.dart';

class ReportVisitController extends GetxController {
  //TODO: Implement ReportVisitController

  var currentForm = 0.obs;

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

  void onChangeCurrentForm(int value) {
    currentForm.value = value;
  }
}

import 'package:get/get.dart';

class ConsultationController extends GetxController {
  //TODO: Implement ConsultationController

  var selectedIndex = 0.obs;
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

  void changeIndexTab(int index) {
    selectedIndex.value = index;
    update();
  }
}

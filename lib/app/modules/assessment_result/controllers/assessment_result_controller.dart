import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';

class AssessmentResultController extends GetxController {
  bool isGood = false;

  late String imagePath;
  late String title;
  late String body;

  @override
  void onInit() {
    super.onInit();
    if (isGood) {
      imagePath = ConstPath.ILLUSTRATION_RESULT_GOOD_PATH;
      title = "Kamu Dalam Kondisi Mental yang Stabil";
      body =
          "Saat ini tidak ditemukan tanda-tanda signifikan dari gangguan mental. Terus rawat dirimu, jangan ragu untuk mencari bantuan bila membutuhkannya.";
      return;
    }

    imagePath = ConstPath.ILLUSTRATION_RESULT_BAD_PATH;
    title = "Kamu Dalam Kondisi Mental yang Stabil";
    body =
        "Saat ini tidak ditemukan tanda-tanda signifikan dari gangguan mental. Terus rawat dirimu, jangan ragu untuk mencari bantuan bila membutuhkannya.";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

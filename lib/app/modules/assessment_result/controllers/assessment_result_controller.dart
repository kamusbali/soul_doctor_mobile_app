import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/domain/model/screening_score.dart';

class AssessmentResultController extends GetxController {
  final ScreeningScore score = Get.arguments;

  bool isGood = false;

  late String imagePath;
  late String title;
  late String body;

  @override
  void onInit() {
    super.onInit();

    isGood =
        (score.stress + score.anxiety + score.depression + score.psychosis) ==
        0;

    if (isGood) {
      imagePath = ConstPath.ILLUSTRATION_RESULT_GOOD_PATH;
      title = "Kamu Dalam Kondisi Mental yang Stabil";
      body =
          "Saat ini tidak ditemukan tanda-tanda signifikan dari gangguan mental. Terus rawat dirimu, jangan ragu untuk mencari bantuan bila membutuhkannya.";
      return;
    }

    var scoreStatus = <String>[];

    if (score.stress != 0) scoreStatus.add("Stress");
    if (score.depression != 0) scoreStatus.add("Depresi");
    if (score.anxiety != 0) scoreStatus.add("Kecemasan");
    if (score.psychosis != 0) scoreStatus.add("Psikosi");

    imagePath = ConstPath.ILLUSTRATION_RESULT_BAD_PATH;
    title = "Terdeteksi indikasi ${scoreStatus.join(", ")}";
    body =
        "Kami menyarankan agar Anda segera berkonsultasi dengan dokter, psikolog, psikiater, atau tenaga kesehatan profesional terdekat untuk memastikan kondisi kesehatan mental Anda sehingga memperoleh penanganan lebih awal.";
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

import 'package:amicons/amicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import '../../../widgets/bottom_navigation_bar/animated_bottom_navigation_bar_item.dart';
import '../../account/views/account_view.dart';
import '../../consultation/views/consultation_view.dart';
import '../../doctor_home/views/doctor_home_view.dart';
import '../../patient/views/patient_view.dart';

class DoctorWrapperController extends GetxController {
  //TODO: Implement DoctorWrapperController

  List<AnimatedBottomNavigationBarItem> selectedItemRole = [
    AnimatedBottomNavigationBarItem(
      view: DoctorHomeView(),
      icon: Amicons.flaticon_home_rounded_fill,
      label: "Beranda",
    ),
    AnimatedBottomNavigationBarItem(
      view: ConsultationView(),
      icon: Amicons.flaticon_treatment_rounded_fill,
      label: "Konsultasi",
    ),
    AnimatedBottomNavigationBarItem(
      view: PatientView(),
      icon: Amicons.remix_user5_fill,
      label: "Pasien",
    ),
    AnimatedBottomNavigationBarItem(
      view: AccountView(),
      icon: Amicons.flaticon_user_rounded_fill,
      label: "Akun",
    ),
  ];

  var autoSizeGroup = AutoSizeGroup();

  var activeIndex = 0.obs;

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

  void onChangeTab(int index) {
    activeIndex.value = index;
  }
}

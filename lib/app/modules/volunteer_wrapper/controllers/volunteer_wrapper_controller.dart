import 'package:amicons/amicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import '../../../widgets/bottom_navigation_bar/animated_bottom_navigation_bar_item.dart';
import '../../account/views/account_view.dart';
import '../../patient/views/patient_view.dart';
import '../../visit/views/visit_view.dart';
import '../../volunteer_home/views/volunteer_home_view.dart';

class VolunteerWrapperController extends GetxController {
  //TODO: Implement VolunteerWrapperController

  List<AnimatedBottomNavigationBarItem> selectedItemRole = [
    AnimatedBottomNavigationBarItem(
      view: VolunteerHomeView(),
      icon: Amicons.flaticon_home_rounded_fill,
      label: "Beranda",
    ),
    AnimatedBottomNavigationBarItem(
      view: VisitView(),
      icon: Amicons.remix_todo_fill,
      label: "Visit",
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

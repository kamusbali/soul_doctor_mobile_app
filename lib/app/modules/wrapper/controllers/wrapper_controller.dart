import 'package:amicons/amicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/model/helpers/animated_bottom_navigation_bar_item.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/modules/account/views/account_view.dart';
import 'package:soul_doctor/app/modules/doctor_history/views/doctor_history_view.dart';
import 'package:soul_doctor/app/modules/doctor_home/views/doctor_home_view.dart';
import 'package:soul_doctor/app/modules/user_history/views/user_history_view.dart';
import 'package:soul_doctor/app/modules/user_home/views/user_home_view.dart';
import 'package:soul_doctor/app/modules/volunteer_history/views/volunteer_history_view.dart';
import 'package:soul_doctor/app/modules/volunteer_home/views/volunteer_home_view.dart';

class WrapperController extends GetxController {
  var autoSizeGroup = AutoSizeGroup();

  Role role = Role.guest;

  List<AnimatedBottomNavigationBarItem> get tabList {
    switch (role) {
      case Role.patient || Role.caregiver || Role.guest:
        return [
          AnimatedBottomNavigationBarItem(
            view: UserHomeView(),
            icon: Amicons.flaticon_home_rounded_fill,
            label: "Beranda",
          ),
          AnimatedBottomNavigationBarItem(
            view: UserHistoryView(),
            icon: Amicons.flaticon_treatment_rounded_fill,
            label: "Riwayat",
          ),
          AnimatedBottomNavigationBarItem(
            view: AccountView(),
            icon: Amicons.flaticon_user_rounded_fill,
            label: "Akun",
          ),
        ];
      case Role.volunteer:
        return [
          AnimatedBottomNavigationBarItem(
            view: VolunteerHomeView(),
            icon: Amicons.flaticon_home_rounded_fill,
            label: "Beranda",
          ),
          AnimatedBottomNavigationBarItem(
            view: VolunteerHistoryView(),
            icon: Amicons.flaticon_treatment_rounded_fill,
            label: "Riwayat",
          ),
          AnimatedBottomNavigationBarItem(
            view: AccountView(),
            icon: Amicons.flaticon_user_rounded_fill,
            label: "Akun",
          ),
        ];
      case Role.doctor:
        return [
          AnimatedBottomNavigationBarItem(
            view: DoctorHomeView(),
            icon: Amicons.flaticon_home_rounded_fill,
            label: "Beranda",
          ),
          AnimatedBottomNavigationBarItem(
            view: DoctorHistoryView(),
            icon: Amicons.flaticon_treatment_rounded_fill,
            label: "Riwayat",
          ),
          AnimatedBottomNavigationBarItem(
            view: AccountView(),
            icon: Amicons.flaticon_user_rounded_fill,
            label: "Akun",
          ),
        ];
    }
  }

  var activeIndex = 0;

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
    activeIndex = index;
    update();
  }

  void resetIndex() {
    activeIndex = 0;
    update();
  }

  void onChangeRole() {
    resetIndex();
    if (role == Role.guest) {
      role = Role.volunteer;
    } else {
      role = Role.guest;
    }
    update();
  }
}

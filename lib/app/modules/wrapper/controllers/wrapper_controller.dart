import 'package:amicons/amicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/domain/model/compact_user.dart';
import 'package:soul_doctor/app/widgets/bottom_navigation_bar/animated_bottom_navigation_bar_item.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/domain/use_case/profile_use_cases/profile_use_cases.dart';
import 'package:soul_doctor/app/modules/account/views/account_view.dart';
import 'package:soul_doctor/app/modules/consultation/views/consultation_view.dart';
import 'package:soul_doctor/app/modules/doctor_home/views/doctor_home_view.dart';
import 'package:soul_doctor/app/modules/patient_history/views/patient_history_view.dart';
import 'package:soul_doctor/app/modules/patient/views/patient_view.dart';
import 'package:soul_doctor/app/modules/user_home/views/user_home_view.dart';
import 'package:soul_doctor/app/modules/visit/views/visit_view.dart';
import 'package:soul_doctor/app/modules/volunteer_home/views/volunteer_home_view.dart';

class WrapperController extends GetxController {
  final ProfileUseCases _profileUseCases;

  WrapperController(this._profileUseCases);

  var autoSizeGroup = AutoSizeGroup();

  CompactUser? user;

  List<AnimatedBottomNavigationBarItem> get tabList {
    switch (user?.role) {
      case Role.patient:
        return [
          AnimatedBottomNavigationBarItem(
            view: UserHomeView(),
            icon: Amicons.flaticon_home_rounded_fill,
            label: "Beranda",
          ),
          AnimatedBottomNavigationBarItem(
            view: PatientHistoryView(),
            icon: Amicons.flaticon_treatment_rounded_fill,
            label: "Riwayat",
          ),
          AnimatedBottomNavigationBarItem(
            view: AccountView(),
            icon: Amicons.flaticon_user_rounded_fill,
            label: "Akun",
          ),
        ];
      case Role.caregiver:
        return [
          AnimatedBottomNavigationBarItem(
            view: UserHomeView(),
            icon: Amicons.flaticon_home_rounded_fill,
            label: "Beranda",
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
      case Role.volunteer:
        return [
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
      case Role.doctor:
        return [
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
      default:
        return [
          AnimatedBottomNavigationBarItem(
            view: UserHomeView(),
            icon: Amicons.flaticon_home_rounded_fill,
            label: "Beranda",
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
    
    getProfile();
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

  void getProfile() async {
    var profileData = await _profileUseCases.getCompactProfileUseCase.execute();

    profileData.fold(
      (failure) {
        user = null;
        update();
      },
      (success) {
        user = success;
        update();
      },
    );
  }
}

import 'package:amicons/amicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/compact_user.dart';
import 'package:soul_doctor/app/domain/model/session_data.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
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

import '../../../helpers/ui_feedback_utils.dart';

class WrapperController extends GetxController {
  final ProfileUseCases _profileUseCases;
  final AuthUseCases _authUseCases;

  WrapperController(this._profileUseCases, this._authUseCases);

  var autoSizeGroup = AutoSizeGroup();

  var user = Resource<SessionData>.none().obs;
  var compactUser = Resource<CompactUser>.none().obs;

  RxList<AnimatedBottomNavigationBarItem> selectedItemRole = [
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
  ].obs;

  var activeIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await onRefreshPage();
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

  void resetIndex() {
    activeIndex.value = 0;
  }

  Future<void> onRefreshPage() async {
    await getProfile();
    await onGetPatientAndCaregiverAttributes();
  }

  Future<void> onGetPatientAndCaregiverAttributes() async {
    print("Mendapatkan data patient caregiver");
    print(user.value.data?.role);
    if (user.value.data?.role == Role.patient ||
        user.value.data?.role == Role.caregiver) {
      print("Here");
      var response = await _profileUseCases.getCompactProfileUseCase.execute();

      response.fold(
        (failure) {
          UiFeedbackUtils.showSnackbar("Error", failure.message);
          compactUser.value = Resource.error(failure.message);
        },
        (success) {
          if (success == null) {
            UiFeedbackUtils.showSnackbar("Error", "Data kosong");
            compactUser.value = Resource.error("Data kosong");
            return;
          }

          print("Sukses dapet data pasien : $success");

          compactUser.value = Resource.success(success);
        },
      );
    }
  }

  Future<void> getProfile() async {
    user.value = Resource.loading();

    var data = await _authUseCases.getSessionDataUseCases.execute();

    if (data == null) {
      selectedItemRole.value = [
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
      ].obs;
      user.value = Resource.none();
      return;
    }

    resetIndex();
    user.value = Resource.success(data);
    if (data.role == Role.patient) {
      selectedItemRole.value = [
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
    }

    if (data.role == Role.caregiver) {
      selectedItemRole.value = [
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
    }

    if (data.role == Role.volunteer) {
      selectedItemRole.value = [
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
    }

    if (data.role == Role.doctor) {
      selectedItemRole.value = [
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
    }
  }

  void onLogoutClear() async {
    activeIndex.value = 0;

    user.value = Resource<SessionData>.none();
    compactUser.value = Resource<CompactUser>.none();

    await onRefreshPage();
    resetIndex();
  }
}

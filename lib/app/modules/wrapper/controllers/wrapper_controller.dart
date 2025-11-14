import 'package:amicons/amicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/compact_user.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/modules/input_profile/settings/input_profile_settings.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';
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
  final AuthUseCases _authUseCases;

  WrapperController(this._profileUseCases, this._authUseCases);

  var autoSizeGroup = AutoSizeGroup();

  var user = Resource<CompactUser>.none().obs;

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
    activeIndex.value = index;
  }

  void resetIndex() {
    activeIndex.value = 0;
  }

  void onRefreshPage() {
    getProfile();
  }

  void getProfile() async {
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

    user.value = Resource.loading();

    var profileData = await _profileUseCases.getCompactProfileUseCase.execute();

    profileData.fold(
      (failure) {
        print(failure.message);
        Get.snackbar("Error", failure.message);
        user.value = Resource.error(failure.message);
      },
      (success) async {
        if (success != null) {
          var fullProfile = await _profileUseCases.getProfileUseCase.execute();

          fullProfile.fold(
            (failureData) {
              Get.snackbar("Error", failureData.message);
            },
            (successData) {
              if (success.role == null) {
                Get.offNamed(
                  Routes.INPUT_PROFILE,
                  arguments: InputProfileSettings(),
                );
                return;
              }
              resetIndex();
              user.value = Resource.success(success);
              if (success.role == Role.patient) {
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

              if (success.role == Role.caregiver) {
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

              if (success.role == Role.volunteer) {
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

              if (success.role == Role.doctor) {
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
            },
          );
        }
      },
    );
  }
}

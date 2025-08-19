import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/assessment_question/bindings/assessment_question_binding.dart';
import '../modules/assessment_question/views/assessment_question_view.dart';
import '../modules/assessment_result/bindings/assessment_result_binding.dart';
import '../modules/assessment_result/views/assessment_result_view.dart';
import '../modules/detail_consultation/bindings/detail_consultation_binding.dart';
import '../modules/detail_consultation/views/detail_consultation_view.dart';
import '../modules/doctor_history/bindings/doctor_history_binding.dart';
import '../modules/doctor_history/views/doctor_history_view.dart';
import '../modules/doctor_home/bindings/doctor_home_binding.dart';
import '../modules/doctor_home/views/doctor_home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/user_history/bindings/user_history_binding.dart';
import '../modules/user_history/views/user_history_view.dart';
import '../modules/user_home/bindings/user_home_binding.dart';
import '../modules/user_home/views/user_home_view.dart';
import '../modules/volunteer_history/bindings/volunteer_history_binding.dart';
import '../modules/volunteer_history/views/volunteer_history_view.dart';
import '../modules/volunteer_home/bindings/volunteer_home_binding.dart';
import '../modules/volunteer_home/views/volunteer_home_view.dart';
import '../modules/wrapper/bindings/wrapper_binding.dart';
import '../modules/wrapper/views/wrapper_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.WRAPPER,
      page: () => const WrapperView(),
      binding: WrapperBinding(),
      children: [
        GetPage(
          name: _Paths.USER_HOME,
          page: () => const UserHomeView(),
          binding: UserHomeBinding(),
        ),
        GetPage(
          name: _Paths.USER_HISTORY,
          page: () => const UserHistoryView(),
          binding: UserHistoryBinding(),
        ),
        GetPage(
          name: _Paths.VOLUNTEER_HOME,
          page: () => const VolunteerHomeView(),
          binding: VolunteerHomeBinding(),
        ),
        GetPage(
          name: _Paths.VOLUNTEER_HISTORY,
          page: () => const VolunteerHistoryView(),
          binding: VolunteerHistoryBinding(),
        ),
        GetPage(
          name: _Paths.DOCTOR_HOME,
          page: () => const DoctorHomeView(),
          binding: DoctorHomeBinding(),
        ),
        GetPage(
          name: _Paths.DOCTOR_HISTORY,
          page: () => const DoctorHistoryView(),
          binding: DoctorHistoryBinding(),
        ),
      ],
      bindings: [
        UserHomeBinding(),
        UserHistoryBinding(),
        VolunteerHomeBinding(),
        VolunteerHistoryBinding(),
        DoctorHomeBinding(),
        DoctorHistoryBinding(),
        AccountBinding(),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CONSULTATION,
      page: () => const DetailConsultationView(),
      binding: DetailConsultationBinding(),
    ),
    GetPage(
      name: _Paths.ASSESSMENT_QUESTION,
      page: () => const AssessmentQuestionView(),
      binding: AssessmentQuestionBinding(),
    ),
    GetPage(
      name: _Paths.ASSESSMENT_RESULT,
      page: () => const AssessmentResultView(),
      binding: AssessmentResultBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}

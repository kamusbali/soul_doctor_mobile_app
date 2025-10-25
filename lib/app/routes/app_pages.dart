import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/account_setting/bindings/account_setting_binding.dart';
import '../modules/account_setting/views/account_setting_view.dart';
import '../modules/account_setting_form/bindings/account_setting_form_binding.dart';
import '../modules/account_setting_form/views/account_setting_form_view.dart';
import '../modules/add_consultation/bindings/add_consultation_binding.dart';
import '../modules/add_consultation/views/add_consultation_view.dart';
import '../modules/add_visit_request/bindings/add_visit_request_binding.dart';
import '../modules/add_visit_request/views/add_visit_request_view.dart';
import '../modules/assessment_question/bindings/assessment_question_binding.dart';
import '../modules/assessment_question/views/assessment_question_view.dart';
import '../modules/assessment_result/bindings/assessment_result_binding.dart';
import '../modules/assessment_result/views/assessment_result_view.dart';
import '../modules/consultation/bindings/consultation_binding.dart';
import '../modules/consultation/views/consultation_view.dart';
import '../modules/detail_consultation/bindings/detail_consultation_binding.dart';
import '../modules/detail_consultation/views/detail_consultation_view.dart';
import '../modules/doctor_home/bindings/doctor_home_binding.dart';
import '../modules/doctor_home/views/doctor_home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/patient/bindings/patient_binding.dart';
import '../modules/patient/views/patient_view.dart';
import '../modules/patient_detail_history/bindings/patient_detail_history_binding.dart';
import '../modules/patient_detail_history/views/patient_detail_history_view.dart';
import '../modules/patient_history/bindings/patient_history_binding.dart';
import '../modules/patient_history/views/patient_history_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/user_home/bindings/user_home_binding.dart';
import '../modules/user_home/views/user_home_view.dart';
import '../modules/visit/bindings/visit_binding.dart';
import '../modules/visit/views/visit_view.dart';
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
      bindings: [
        UserHomeBinding(),
        PatientHistoryBinding(),
        PatientBinding(),
        VolunteerHomeBinding(),
        VisitBinding(),
        DoctorHomeBinding(),
        ConsultationBinding(),
        AccountBinding(),
      ],
    ),
    GetPage(
      name: _Paths.USER_HOME,
      page: () => UserHomeView(),
      binding: UserHomeBinding(),
    ),
    GetPage(
      name: _Paths.PATIENT_HISTORY,
      page: () => const PatientHistoryView(),
      binding: PatientHistoryBinding(),
    ),
    GetPage(
      name: _Paths.VOLUNTEER_HOME,
      page: () => VolunteerHomeView(),
      binding: VolunteerHomeBinding(),
    ),
    GetPage(
      name: _Paths.VISIT,
      page: () => const VisitView(),
      binding: VisitBinding(),
    ),
    GetPage(
      name: _Paths.PATIENT,
      page: () => PatientView(),
      binding: PatientBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_HOME,
      page: () => DoctorHomeView(),
      binding: DoctorHomeBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION,
      page: () => const ConsultationView(),
      binding: ConsultationBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
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
    GetPage(
      name: _Paths.ADD_CONSULTATION,
      page: () => const AddConsultationView(),
      binding: AddConsultationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_VISIT_REQUEST,
      page: () => const AddVisitRequestView(),
      binding: AddVisitRequestBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTING,
      page: () => const AccountSettingView(),
      binding: AccountSettingBinding(),
    ),
    GetPage(
      name: _Paths.PATIENT_DETAIL_HISTORY,
      page: () => const PatientDetailHistoryView(),
      binding: PatientDetailHistoryBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTING_FORM,
      page: () => const AccountSettingFormView(),
      binding: AccountSettingFormBinding(),
    ),
  ];
}

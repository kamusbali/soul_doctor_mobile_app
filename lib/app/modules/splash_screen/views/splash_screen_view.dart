import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:soul_doctor/app/domain/model/role.dart';

import '../../../common/constant/const_path.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen.withScreenRouteFunction(
        splash: ConstPath.ICON_APP_PATH,
        screenRouteFunction: () async {
          await controller.onGetSessionData();

          if (controller.sessionData?.role == Role.patient) {
            if ((controller.sessionData?.fullname ?? "").isEmpty &&
                (controller.sessionData?.nickname ?? "").isEmpty) {
              return Routes.INPUT_PROFILE;
            }

            return Routes.PATIENT_WRAPPER;
          } else if (controller.sessionData?.role == Role.caregiver) {
            if ((controller.sessionData?.fullname ?? "").isEmpty &&
                (controller.sessionData?.nickname ?? "").isEmpty) {
              return Routes.INPUT_PROFILE;
            }

            return Routes.CAREGIVER_WRAPPER;
          } else if (controller.sessionData?.role == Role.volunteer) {
            if ((controller.sessionData?.fullname ?? "").isEmpty &&
                (controller.sessionData?.nickname ?? "").isEmpty) {
              return Routes.INPUT_PROFILE;
            }

            return Routes.VOLUNTEER_WRAPPER;
          } else if (controller.sessionData?.role == Role.doctor) {
            if ((controller.sessionData?.fullname ?? "").isEmpty &&
                (controller.sessionData?.nickname ?? "").isEmpty) {
              return Routes.INPUT_PROFILE;
            }

            return Routes.DOCTOR_WRAPPER;
          }

          return Routes.GUEST_WRAPPER;
        },
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: 100,
      ),
    );
  }
}

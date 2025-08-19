import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

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
          return Routes.WRAPPER;
        },
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: 100,
      ),
    );
  }
}

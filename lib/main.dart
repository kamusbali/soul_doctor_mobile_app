import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';

import 'app/routes/app_pages.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale("id", "ID"),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.interTextTheme(),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: ColorTheme.CRIMSON_500,
          onPrimary: ColorTheme.NEUTRAL_100,
          secondary: ColorTheme.CRIMSON_500,
          onSecondary: ColorTheme.NEUTRAL_100,
          error: ColorTheme.CRIMSON_500,
          onError: ColorTheme.NEUTRAL_100,
          surface: ColorTheme.SURFACE,
          onSurface: ColorTheme.TEXT_100,
        ),
      ),
    );
  }
}

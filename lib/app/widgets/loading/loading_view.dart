import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 80,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: SpacingTheme.SPACING_8,
        vertical: SpacingTheme.SPACING_6,
      ),

      child: CircularProgressIndicator(),
    );
  }
}

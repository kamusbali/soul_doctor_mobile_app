import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/widgets/dialog/basic_dialog.dart';

class UiFeedbackUtils {
  static void showDialog({
    required String title,
    required String body,
    String? imagePath,
    String? primaryButtonText,
    void Function()? onPrimaryPressed,
    String? secondaryButtonText,
    void Function()? onSecondaryPressed,
    bool barrierDismissible = true,
    bool useSafeArea = true,
  }) {
    Get.dialog(
      BasicDialog(
        title: title,
        body: body,
        imagePath: imagePath,
        primaryButtonText: primaryButtonText,
        onPrimaryPressed: onPrimaryPressed,
        secondaryButtonText: secondaryButtonText,
        onSecondaryPressed: onSecondaryPressed,
      ),
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
    );
  }

  static void showSnackbar(String title, String message) {
    final context = Get.context;

    if (context == null) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(message),
            ],
          ),
        ),
      );
  }
}

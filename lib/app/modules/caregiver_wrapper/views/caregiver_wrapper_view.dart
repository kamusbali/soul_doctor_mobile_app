import 'package:amicons/amicons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../helpers/ui_feedback_utils.dart';
import '../controllers/caregiver_wrapper_controller.dart';

class CaregiverWrapperView extends GetView<CaregiverWrapperController> {
  const CaregiverWrapperView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.activeIndex.value,
          children: controller.selectedItemRole
              .map((element) => element.view)
              .toList(),
        ),
      ),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
          itemCount: controller.selectedItemRole.length,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                Icon(
                  controller.selectedItemRole[index].icon,
                  size: 20,
                  color: controller.activeIndex.value == index
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black54,
                ),
                const SizedBox(height: 4),
                if (controller.selectedItemRole[index].label != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: AutoSizeText(
                      controller.selectedItemRole[index].label!,
                      maxLines: 1,
                      group: controller.autoSizeGroup,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: controller.activeIndex.value == index
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black54,
                      ),
                    ),
                  ),
              ],
            );
          },
          activeIndex: controller.activeIndex.value,
          onTap: controller.onChangeTab,
          gapLocation: GapLocation.none,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: ColorTheme.SURFACE,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: SpacingTheme.SPACING_4,
                  children: [
                    Text("Butuh Bantuan?", style: TextStyleTheme.BODY_2),
                    InkWell(
                      onTap: () async {
                        try {
                          if (!await launchUrl(Uri.parse("tel:+62361467553"))) {
                            UiFeedbackUtils.showSnackbar(
                              "Error",
                              "Tidak dapat mengarahkan link",
                            );
                          }
                        } on PlatformException {
                          UiFeedbackUtils.showSnackbar(
                            "Error",
                            "Platform anda tidak mendukung!",
                          );
                        }
                      },
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: ColorTheme.CRIMSON_600,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          spacing: SpacingTheme.SPACING_8,
                          children: [
                            Icon(
                              Amicons.lucide_phone_call,
                              color: ColorTheme.NEUTRAL_100,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Panggilan Darurat",
                                    style: TextStyleTheme.BODY_2.copyWith(
                                      color: ColorTheme.NEUTRAL_100,
                                    ),
                                  ),
                                  Text(
                                    "Telepon nomor darurat sekarang",
                                    style: TextStyleTheme.PARAGRAPH_5.copyWith(
                                      color: ColorTheme.NEUTRAL_100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        try {
                          if (!await launchUrl(
                            Uri.parse("https://wa.me/+62361467553"),
                          )) {
                            UiFeedbackUtils.showSnackbar(
                              "Error",
                              "Tidak dapat mengarahkan link",
                            );
                          }
                        } on PlatformException {
                          UiFeedbackUtils.showSnackbar(
                            "Error",
                            "Platform anda tidak mendukung!",
                          );
                        }
                      },
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: ColorTheme.EUCALYPTUS_600,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          spacing: SpacingTheme.SPACING_8,
                          children: [
                            Icon(
                              Amicons.remix_whatsapp,
                              color: ColorTheme.NEUTRAL_100,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contact Support",
                                    style: TextStyleTheme.BODY_2.copyWith(
                                      color: ColorTheme.NEUTRAL_100,
                                    ),
                                  ),
                                  Text(
                                    "Chat tim support via WhatsApp",
                                    style: TextStyleTheme.PARAGRAPH_5.copyWith(
                                      color: ColorTheme.NEUTRAL_100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isScrollControlled: true,
          );
        },
        child: Icon(Amicons.lucide_info),
      ),
    );
  }
}

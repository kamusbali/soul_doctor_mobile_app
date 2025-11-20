import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/patient_wrapper_controller.dart';

class PatientWrapperView extends GetView<PatientWrapperController> {
  const PatientWrapperView({super.key});
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
    );
  }
}

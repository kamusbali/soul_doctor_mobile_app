import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wrapper_controller.dart';

class WrapperView extends GetView<WrapperController> {
  const WrapperView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: controller,
          builder: (_) {
            return IndexedStack(
              index: controller.activeIndex,
              children: controller.tabList
                  .map((element) => element.view)
                  .toList(),
            );
          },
        ),
      ),
      bottomNavigationBar: GetBuilder(
        init: controller,
        builder: (_) {
          return AnimatedBottomNavigationBar.builder(
            itemCount: controller.tabList.length,
            tabBuilder: (int index, bool isActive) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Icon(
                    controller.tabList[index].icon,
                    size: 20,
                    color: controller.activeIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black54,
                  ),
                  const SizedBox(height: 4),
                  if (controller.tabList[index].label != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: AutoSizeText(
                        controller.tabList[index].label!,
                        maxLines: 1,
                        group: controller.autoSizeGroup,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: controller.activeIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black54,
                        ),
                      ),
                    ),
                ],
              );
            },
            activeIndex: controller.activeIndex,
            onTap: controller.onChangeTab,
            gapLocation: GapLocation.none,
          );
        },
      ),
    );
  }
}

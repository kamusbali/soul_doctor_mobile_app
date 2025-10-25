import 'package:flutter/widgets.dart';

class AnimatedBottomNavigationBarItem {
  Widget view;
  IconData icon;
  String? label;

  AnimatedBottomNavigationBarItem({
    required this.view,
    required this.icon,
    this.label,
  });
}

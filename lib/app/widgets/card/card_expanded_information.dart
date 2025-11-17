import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';
import 'package:soul_doctor/app/widgets/item/item_information.dart';

class CardExpandedInformation extends StatefulWidget {
  const CardExpandedInformation({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
    // required this.futureItems,
  });

  final String title;
  final IconData icon;
  final List<ItemInformation> items;
  // final Future<List<ItemInformation>> Function() futureItems;

  @override
  State<CardExpandedInformation> createState() =>
      _CardExpandedInformationState();
}

class _CardExpandedInformationState extends State<CardExpandedInformation>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  late final AnimationController _controller;
  late final Animation<double> _arrowTurns;
  late final Animation<double> _expand;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _arrowTurns = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _expand = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _toggle() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(SpacingTheme.SPACING_8),
      decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
      child: Column(
        children: [
          Row(
            children: [
              Icon(widget.icon, color: ColorTheme.CRIMSON_500),
              SizedBox(width: SpacingTheme.SPACING_4),
              Expanded(child: Text(widget.title, style: TextStyleTheme.BODY_2)),
            ],
          ),
          Divider(color: ColorTheme.NEUTRAL_500),
          AnimatedBuilder(
            animation: _expand,
            builder: (context, child) {
              return Align(
                heightFactor: _expand.value, // animasi tinggi
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: _expand.value.clamp(0.0, 1.0),
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(
                top: SpacingTheme.SPACING_6,
                bottom: SpacingTheme.SPACING_3,
              ),
              child: Column(
                spacing: SpacingTheme.SPACING_6,
                children: widget.items,
              ),
            ),
          ),
          InkWell(
            onTap: _toggle,
            child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                horizontal: SpacingTheme.SPACING_8,
                vertical: SpacingTheme.SPACING_1,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  if (isExpanded) Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: SpacingTheme.SPACING_4,
                    children: [
                      Text(
                        isExpanded ? "Lihat Lebih Sedikit" : "Lihat Semua",
                        style: TextStyleTheme.LABEL_1.copyWith(
                          color: ColorTheme.CRIMSON_500,
                        ),
                      ),

                      RotationTransition(
                        turns: _arrowTurns,
                        child: Icon(
                          Amicons.flaticon_angle_small_down_rounded,
                          color: ColorTheme.CRIMSON_500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

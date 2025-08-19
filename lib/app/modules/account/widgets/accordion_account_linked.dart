import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/modules/account/widgets/card_account_linked.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';

class AccordionAccountLinked extends StatefulWidget {
  const AccordionAccountLinked({super.key});

  @override
  State<AccordionAccountLinked> createState() => _AccordionAccountLinkedState();
}

class _AccordionAccountLinkedState extends State<AccordionAccountLinked>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  late final AnimationController _controller;
  late final Animation<double> _arrowTurns; // rotasi ikon 0..0.5 = 0..180°
  late final Animation<double> _expand; // progress expand 0..1

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
    return Column(
      children: [
        InkWell(
          onTap: _toggle,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Pengasuh Pasien",
                    style: TextStyleTheme.BODY_2.copyWith(
                      color: ColorTheme.TEXT_100,
                    ),
                  ),
                ),
                RotationTransition(
                  turns: _arrowTurns,
                  child: Icon(
                    Amicons.flaticon_angle_small_down_rounded,
                    color: ColorTheme.NEUTRAL_700,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Konten dengan animasi expand + fade
        ClipRect(
          child: AnimatedBuilder(
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
            child: Column(
              children: [
                SizedBox(height: SpacingTheme.SPACING_8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: SpacingTheme.SPACING_4,
                      children: const [
                        CardAccountLinked(),
                        // tambahkan item lain di sini
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

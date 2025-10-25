import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/color_theme.dart';
import '../../core/theme/spacing_theme.dart';

class AnimatedProgressBar extends StatefulWidget {
  const AnimatedProgressBar({
    super.key,
    required this.value,
    required this.total,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOutCubic,
  });

  final double value;
  final double total;
  final Duration duration;
  final Curve curve;

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _anim;
  double _from = 0.0; // nilai lama
  double _to = 0.0; // nilai baru

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _from = widget.value;
    _to = widget.value;
    _anim = Tween<double>(
      begin: _from,
      end: _to,
    ).chain(CurveTween(curve: widget.curve)).animate(_controller);
    // start at initial (no animation)
    _controller.value = 1.0;
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Jika value/total berubah, animasikan dari nilai tampilan saat ini ke target baru
    final currentDisplayed = _anim.value; // posisi terakhir animasi
    _from = currentDisplayed;
    _to = widget.value;

    _controller.duration = widget.duration;
    _controller.reset();
    _anim = Tween<double>(
      begin: _from,
      end: _to,
    ).chain(CurveTween(curve: widget.curve)).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _ratio(double value, double total) {
    final safeTotal = total <= 0 ? 1.0 : total;
    return (value / safeTotal).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    const double barHeight = SpacingTheme.SPACING_2;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth == double.infinity
            ? Get.width
            : constraints.maxWidth;

        return AnimatedBuilder(
          animation: _anim,
          builder: (context, _) {
            final progress = _ratio(_anim.value, widget.total);
            final filledWidth = maxWidth * progress;

            return Stack(
              children: [
                // Background bar
                Container(
                  width: maxWidth,
                  height: barHeight,
                  decoration: BoxDecoration(
                    color: ColorTheme.NEUTRAL_500,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                // Foreground (animated) bar
                Container(
                  width: filledWidth,
                  height: barHeight,
                  decoration: BoxDecoration(
                    color: ColorTheme.CRIMSON_500,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

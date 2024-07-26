import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_app_current_location/features/screens/home_screen/weather_view/elements/ray.dart';

class RayCircle extends StatefulWidget {
  final bool smallRay;
  final bool gradient;
  final bool rotation;
  final double height;

  const RayCircle({
    super.key,
    this.smallRay = false,
    this.gradient = false,
    this.rotation = false,
    required this.height,
  });

  @override
  State<RayCircle> createState() => _RayCircleState();
}

class _RayCircleState extends State<RayCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );
    if (widget.rotation) {
      _animationController.repeat();
    } else {
      _animationController.stop();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          int n = widget.smallRay ? 16 : 8;
          return Transform.rotate(
            angle: _animationController.value * 2 * math.pi,
            child: Container(
              height: widget.height,
              width: widget.height,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  ...List.generate(n, (index) {
                    double bigRayHeight = 0.2 * widget.height;
                    double smallRayHeight = 0.5 * bigRayHeight;
                    double rayHeight = widget.smallRay && index % 2 != 0
                        ? smallRayHeight
                        : bigRayHeight;
                    double koefBase = 0.65;
                    double koef = widget.smallRay && index % 2 != 0
                        ? koefBase - 0.05
                        : koefBase;
                    double angle = index * (pi * 2) / n;
                    num base = 0.6 * widget.height;
                    double x = koef * base * cos(angle);
                    double y = -koef * base * sin(angle);
                    double rayWidth = 0.05 * widget.height;
                    return Positioned(
                      top: 0.5 * widget.height - x - 0.5 * rayHeight,
                      left: 0.5 * widget.height - y - 0.5 * rayWidth,
                      child: Transform.rotate(
                        angle: angle,
                        child: Ray(
                            gradient: widget.gradient,
                            height: widget.smallRay && index % 2 != 0
                                ? smallRayHeight
                                : rayHeight,
                            width: rayWidth),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        });
  }
}

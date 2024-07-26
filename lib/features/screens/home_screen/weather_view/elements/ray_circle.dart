import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_app_current_location/features/screens/home_screen/weather_view/elements/ray.dart';

class RayCircle extends StatefulWidget {
  final bool gradient;
  final bool rotation;
  final double height;

  const RayCircle({
    super.key,
    required this.gradient,
    required this.rotation,
    required this.height,
  });

  @override
  State<RayCircle> createState() => _RayCircleState();
}

class _RayCircleState extends State<RayCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 15))
          ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool smallRay = false;
    return AnimatedBuilder(
        animation: widget.rotation
            ? _animationController
            : AnimationController(
                vsync: this, duration: const Duration(seconds: 0)),
        builder: (context, child) {
          int n = smallRay ? 16 : 8;
          return Transform.rotate(
            angle: _animationController.value * 2 * math.pi,
            child: Container(
              height: widget.height,
              width: widget.height,
              child: Stack(
                children: [
                  ...List.generate(n, (index) {
                    var bigRayHeight = 0.3 * widget.height;

                    var smallRayHeight = 0.5 * bigRayHeight;
                    double rayHeight = smallRay && index % 2 != 0
                        ? smallRayHeight
                        : bigRayHeight;
                    double koefBase = 0.5;
                    double koef =
                        smallRay && index % 2 != 0 ? koefBase - 0.1 : koefBase;
                    double angle = index * (pi * 2) / n;
                    num base = 0.6 * widget.height;
                    double x = koef * base * cos(angle);
                    double y = -koef * base * sin(angle);
                    var rayWidth = 5.0;
                    return Positioned(
                      top: 0.5 * widget.height - x - 0.5 * rayHeight,
                      left: 0.5 * widget.height - y - 0.5 * rayWidth,
                      child: Transform.rotate(
                        angle: angle,
                        child: Ray(
                            gradient: true,
                            height: smallRay && index % 2 != 0
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

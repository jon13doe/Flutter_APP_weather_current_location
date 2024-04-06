import 'dart:math';

import 'package:flutter/material.dart';

class Sun extends StatelessWidget {
  final bool smallRay;
  final bool gradient;
  final bool rise;

  const Sun({
    super.key,
    required this.gradient,
    required this.smallRay,
    this.rise = true,
  });

  @override
  Widget build(BuildContext context) {
    int n = smallRay ? 16 : 8;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double base = constraints.maxHeight >= constraints.maxWidth
            ? constraints.maxWidth
            : constraints.maxHeight;
        double bulbDiametr = 0.5 * base;
        double bigRayHeight = 0.2 * base;
        double rayWidth = 0.05 * base;
        double smallRayHeight = 0.5 * bigRayHeight;

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: bulbDiametr,
              width: bulbDiametr,
              decoration: BoxDecoration(
                color: gradient ? null : Colors.amber,
                gradient: gradient
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: rise ? Alignment.bottomCenter : Alignment.center,
                        colors: const [Colors.yellow, Colors.red])
                    : null,
                shape: BoxShape.circle,
              ),
            ),
            ...List.generate(n, (index) {
              double rayHeight =
                  smallRay && index % 2 != 0 ? smallRayHeight : bigRayHeight;
              double koef = smallRay && index % 2 != 0 ? 0.35 : 0.4;
              double angle = index * (pi * 2) / n;
              double x = koef * base * cos(angle);
              double y = -koef * base * sin(angle);
              return Positioned(
                top: 0.5 * constraints.maxHeight - x - 0.5 * rayHeight,
                left: 0.5 * constraints.maxWidth - y - 0.5 * rayWidth,
                child: Transform.rotate(
                  angle: angle,
                  child: Container(
                    height:
                        smallRay && index % 2 != 0 ? smallRayHeight : rayHeight,
                    width: rayWidth,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(0.5 * rayWidth),
                    ),
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}

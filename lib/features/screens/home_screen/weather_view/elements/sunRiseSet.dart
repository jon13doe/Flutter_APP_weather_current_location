import 'package:flutter/material.dart';

import 'moon.dart';
import 'sun.dart';

class SunRiseSet extends StatelessWidget {
  final bool sun;
  final bool rise;

  const SunRiseSet({
    super.key,
    required this.rise,
    required this.sun,
  });

  @override
  Widget build(BuildContext context) {
    double heightKoef = rise ? 0.5125 : 0.3125;
    int n = rise ? 2 : 3;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double base = constraints.maxHeight >= constraints.maxWidth
            ? constraints.maxWidth
            : constraints.maxHeight;
        double sunBase = base;
        double groundWidth = base;
        double groundHeight = 0.033 * base;
        double horizont = 0.5 * groundHeight;

        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: heightKoef * base,
              child: Stack(
                children: [
                  Positioned(
                    left: 0.5 * (base - sunBase),
                    child: SizedBox(
                      height: sunBase,
                      width: sunBase,
                      child: sun
                          ? Sun(
                              gradient: true,
                              smallRay: true,
                              rise: rise ? true : false,
                            )
                          : const Moon(),
                    ),
                  ),
                ],
              ),
            ),
            ...List.generate(n, (index) {
              return Positioned(
                top: (0.5 + 0.5 * heightKoef) * base +
                    horizont +
                    (index * 0.2 / n) * base,
                left: 0.5 * constraints.maxWidth -
                    0.5 * ((1 - index * 1 / n) * groundWidth),
                child: Container(
                  height: groundHeight,
                  width: (1 - index * 1 / n) * groundWidth,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(0.5 * groundHeight),
                  ),
                ),
              );
            })
          ],
        );
      },
    );
  }
}

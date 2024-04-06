import 'package:flutter/material.dart';

import 'moon.dart';
import 'sun.dart';
import 'termometer.dart';

class MinMaxTemp extends StatelessWidget {
  final bool maxTemp;
  const MinMaxTemp({super.key, required this.maxTemp});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool widthBase =
            constraints.maxHeight >= constraints.maxWidth ? true : false;
        double base = widthBase ? constraints.maxWidth : constraints.maxHeight;
        double termometer = base;
        double iconBase = 0.35 * base;

        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0.5 * (constraints.maxHeight - termometer),
              left: 0.5 * (constraints.maxWidth - termometer) - 0.25 * iconBase,
              child: SizedBox(
                height: termometer,
                width: termometer,
                child: Termometer(maxTemp: maxTemp),
              ),
            ),
            Positioned(
              top: 0.5 * constraints.maxHeight - iconBase,
              left: 0.5 * constraints.maxWidth,
              child: SizedBox(
                height: iconBase,
                width: iconBase,
                child: maxTemp ? const Sun(gradient: false, smallRay: true,) : const Moon(),
              ),
            ),
          ],
        );
      },
    );
  }
}

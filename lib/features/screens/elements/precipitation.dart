import 'dart:math';

import 'package:flutter/material.dart';

class Precipitation extends StatelessWidget {
  final bool rain;
  final int intensity;
  final bool wind;

  const Precipitation({
    super.key,
    required this.intensity,
    required this.wind, required this.rain,
  });

  @override
  Widget build(BuildContext context) {
    double angle = wind ? pi / 6 : pi;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      bool widthBase =
          constraints.maxHeight >= constraints.maxWidth ? true : false;
      double base = widthBase ? constraints.maxWidth : constraints.maxHeight;
      double precipitationHorizont = 0.5 * base;
      double precipitationSize = 0.1 * base;
      double precipitationHeight = rain ? precipitationSize : 0.35 * precipitationSize;
      double precipitationWidth = 0.35 * precipitationSize;
      int intensityCurrent = rain ? intensity : 2 * intensity;

      return SizedBox(
        height: precipitationHeight * (2 * intensityCurrent - 1),
        width: precipitationHorizont,
        child: Column(
          children: [
            ...List.generate((2 * intensityCurrent - 1), (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(7, (index) {
                    if (rowIndex % 2 == 0) {
                      if ((rowIndex % 4 == 0 && index % 2 == 0) || (rowIndex % 4 != 0 && index % 2 != 0)) {
                        return Transform.rotate(
                        angle: angle,
                        child: Container(
                          height: precipitationHeight,
                          width: precipitationWidth,
                          decoration: BoxDecoration(
                            color: rain ? Colors.blue[700] : Colors.white,
                            borderRadius:
                                BorderRadius.circular(0.5 * precipitationWidth),
                          ),
                        ),
                      );
                      } else {
                        return SizedBox(
                        width: precipitationHeight,
                      );
                      }
                    } else {
                      return SizedBox(
                        height: 0.5 * precipitationHeight,
                      );
                    }
                  }),
                ],
              );
            }),
          ],
        ),
      );
    });
  }
}

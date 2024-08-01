import 'dart:math';

import 'package:flutter/material.dart';

class Precipitation extends StatefulWidget {
  final int type;
  final int intensity;
  final double windSpeed;

  const Precipitation({
    super.key,
    this.type = 0,
    this.intensity = 0,
    this.windSpeed = 0,
  });

  @override
  State<Precipitation> createState() => _PrecipitationState();
}

windSpeed({required double windSpeed}) {
  switch (windSpeed) {
    case > 0.3 && < 1.5:
      return 1.0;
    case > 1.6 && < 3.4:
      return 2.0;
    case > 3.4 && < 5.4:
      return 2.0;
    case > 5.5 && < 7.9:
      return 3.0;
    case > 8.0 && < 10.7:
      return 4.0;
    case > 10.8 && < 13.8:
      return 5.0;
    case > 13.9 && < 17.1:
      return 6.0;
    case > 17.2 && < 20.7:
      return 7.0;
    case > 20.8:
      return 8.0;
    default:
      return 0.0;
  }
}

class _PrecipitationState extends State<Precipitation> {
  @override
  Widget build(BuildContext context) {
    double angle = -windSpeed(windSpeed: widget.windSpeed) * pi / 32;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double precipitationHorizont = 0.5 * constraints.maxWidth;
      double precipitationSize = 0.1 * constraints.maxWidth;
      double precipitationHeight =
          widget.intensity > 0 ? precipitationSize : 0.35 * precipitationSize;
      double precipitationWidth = 0.35 * precipitationSize;

      return widget.intensity == 0
          ? const SizedBox()
          : SizedBox(
              height: precipitationHeight * (2 * widget.intensity - 1),
              width: precipitationHorizont,
              child: Column(
                children: [
                  ...List.generate(2 * widget.intensity - 1, (rowIndex) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(7, (index) {
                          if (rowIndex % 2 == 0) {
                            if ((rowIndex % 4 == 0 && index % 2 == 0) ||
                                (rowIndex % 4 != 0 && index % 2 != 0)) {
                              return Transform.rotate(
                                angle: angle,
                                child: Container(
                                  height: precipitationHeight,
                                  width: precipitationWidth,
                                  decoration: BoxDecoration(
                                    color: [
                                      Colors.blue[700],
                                      Colors.white,
                                      Colors.grey
                                    ][widget.type],
                                    borderRadius: BorderRadius.circular(
                                        0.5 * precipitationWidth),
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

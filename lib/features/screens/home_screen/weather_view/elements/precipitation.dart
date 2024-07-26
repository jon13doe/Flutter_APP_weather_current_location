import 'package:flutter/material.dart';

class Precipitation extends StatefulWidget {
  final bool rain;
  final int intensity;
  final double wind;

  const Precipitation({
    super.key,
    this.intensity = 1,
    required this.wind,
    required this.rain,
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
    case < 20.8:
      return 8.0;
    default:
      return 0.0;
  }
}

class _PrecipitationState extends State<Precipitation> {
  @override
  Widget build(BuildContext context) {
    double angle = windSpeed(windSpeed: widget.wind);
    int intensity = widget.intensity > 0 ? widget.intensity : 1;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      bool widthBase =
          constraints.maxHeight >= constraints.maxWidth ? true : false;
      double base = widthBase ? constraints.maxWidth : constraints.maxHeight;
      double precipitationHorizont = 0.5 * base;
      double precipitationSize = 0.1 * base;
      double precipitationHeight =
          widget.rain ? precipitationSize : 0.35 * precipitationSize;
      double precipitationWidth = 0.35 * precipitationSize;
      int intensityCurrent = intensity;

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
                      if ((rowIndex % 4 == 0 && index % 2 == 0) ||
                          (rowIndex % 4 != 0 && index % 2 != 0)) {
                        return Transform.rotate(
                          angle: -angle,
                          child: Container(
                            height: precipitationHeight,
                            width: precipitationWidth,
                            decoration: BoxDecoration(
                              color:
                                  widget.rain ? Colors.blue[700] : Colors.white,
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

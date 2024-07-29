import 'package:flutter/material.dart';

import 'elements/index.dart';

class WeatherView extends StatefulWidget {
  final int? code;
  final double windSpeed;

  const WeatherView({super.key, required this.code, required this.windSpeed});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool sun = sunny(index: widget.code);

    return Stack(
      children: [
        SizedBox(
          width: width,
          height: 0.7 * width,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: sun
                      ? Alignment.center
                      : const AlignmentDirectional(0.4, -0.5),
                  child: SizedBox(
                    height: sun
                        ? 0.75 * constraints.maxHeight
                        : 0.5 * constraints.maxHeight,
                    child: const Sun(),
                  ),
                ),
                sun == false
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 0.75 * constraints.maxHeight,
                          child: CloudPreciptation(
                            cloudColor: widget.code! % 100,
                            preciptationType:
                                preciptationType(index: widget.code),
                            preciptationIntencity:
                                preciptationIntencity(index: widget.code),
                            windSpeed: widget.windSpeed,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          }),
        ),
      ],
    );
  }

  bool sunny({int? index}) {
    if (index == 800 || index == 801) {
      return true;
    } else {
      return false;
    }
  }

  preciptationType({int? index}) {
    if (index! ~/ 100 == 6) {
      return 1;
    } else if (index ~/ 100 == 5 || index ~/ 100 == 3 || index ~/ 100 == 2) {
      return 0;
    }
  }

  preciptationIntencity({int? index}) {
    if ([201, 231, 301, 311, 501, 601, 613, 616].contains(index)) {
      return 2;
    } else if ([
      202,
      232,
      302,
      312,
      313,
      314,
      321,
      502,
      503,
      504,
      521,
      522,
      531,
      602,
      622
    ].contains(index)) {
      return 3;
    } else {
      return 1;
    }
  }
}

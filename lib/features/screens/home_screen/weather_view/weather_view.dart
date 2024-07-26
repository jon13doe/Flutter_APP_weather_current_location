import 'package:flutter/material.dart';

import 'elements/index.dart';

class WeatherView extends StatefulWidget {
  final int code;

  const WeatherView({super.key, required this.code});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          width: width,
          height: 0.5 * width,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                //Sun(),
                Sky(),
                // Positioned(
                //     top: 0.32 * constraints.maxHeight,
                //     left: 0.725 * constraints.maxWidth,
                //     child: SizedBox(
                //       height: 0.35 * constraints.maxHeight,
                //       width: 0.2 * constraints.maxWidth,
                //       child: const Precipitation(
                //         rain: true,
                //         intensity: 4,
                //         wind: 2,
                //       ),
                //     )),
                // Positioned(
                //   top: 0.025 * constraints.maxHeight,
                //   left: 0.05 * constraints.maxWidth,
                //   child: SizedBox(
                //       height: 0.6 * constraints.maxHeight,
                //       child: const Cloud(
                //         color: 1,
                //       )),
                // ),
                // Positioned(
                //     top: 0.5125 * constraints.maxHeight,
                //     left: 0.35 * constraints.maxWidth -
                //         0.5 * (0.4 * constraints.maxWidth),
                //     child: SizedBox(
                //       height: 0.45 * constraints.maxHeight,
                //       width: 0.3 * constraints.maxWidth,
                //       child: const Precipitation(
                //         rain: true,
                //         intensity: 4,
                //         wind: 2,
                //       ),
                //     )),
                // Positioned(
                //   top: 0.14 * constraints.maxHeight,
                //   left: 0.12 * constraints.maxWidth,
                //   child: SizedBox(
                //       height: 0.55 * constraints.maxHeight,
                //       width: constraints.maxWidth,
                //       child: const Sun(
                //         gradient: false,
                //         smallRay: false,
                //       )),
                // ),
                // SizedBox(
                //     height: 0.65 * constraints.maxHeight,
                //     child: const Cloud(
                //       color: 0,
                //     )),
                // Positioned(
                //   top: 0.7 * constraints.maxHeight,
                //   left: 0.5 * constraints.maxWidth -
                //       0.5 * (0.4 * constraints.maxWidth),
                //   child: SizedBox(
                //     height: 0.65 * constraints.maxHeight,
                //     width: 0.4 * constraints.maxWidth,
                //     child: const Precipitation(
                //       rain: false,
                //       intensity: 4,
                //       wind: 2,
                //     ),
                //   ),
                // ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

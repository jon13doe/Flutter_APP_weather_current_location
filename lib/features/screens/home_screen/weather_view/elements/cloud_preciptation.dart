// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app_current_location/features/screens/home_screen/weather_view/elements/index.dart';

import 'cloud.dart';
import 'precipitation.dart';

class CloudPreciptation extends StatefulWidget {
  final int cloudColor;
  final int preciptationType;
  final int preciptationIntencity;
  final double windSpeed;

  const CloudPreciptation({
    super.key,
    required this.cloudColor,
    required this.preciptationType,
    required this.preciptationIntencity,
    required this.windSpeed,
  });

  @override
  State<CloudPreciptation> createState() => _CloudPreciptationState();
}

class _CloudPreciptationState extends State<CloudPreciptation>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 2,
              child: SizedBox(
                height: 0.3 * constraints.maxHeight,
                child: const Thunder(),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 0.5 * constraints.maxHeight,
                  child: Cloud(
                    color: widget.cloudColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    width: 0.3 * constraints.maxWidth,
                    child: Precipitation(
                      type: widget.preciptationType,
                      intensity: widget.preciptationIntencity,
                      windSpeed: widget.windSpeed,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              widthFactor: 5,
              child: SizedBox(
                height: 0.2 * constraints.maxHeight,
                child: const Thunder(),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              widthFactor: 5,
              child: SizedBox(
                height: 0.2 * constraints.maxHeight,
                child: const Thunder(),
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app_current_location/features/screens/home_screen/weather_view/elements/ray_circle.dart';

class Sun extends StatelessWidget {
  final bool rise;
  final bool smallRay;
  final bool gradient;

  const Sun({
    super.key,
    this.rise = false,
    this.smallRay = false,
    this.gradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double bulbDiametr = constraints.maxHeight / 2;

        return Stack(
          alignment: Alignment.center,
          children: [
            RayCircle(
              height: constraints.maxHeight,
            ),
            Container(
              height: bulbDiametr,
              width: bulbDiametr,
              decoration: BoxDecoration(
                color: gradient ? null : Colors.amber,
                gradient: gradient
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: rise ? Alignment.bottomCenter : Alignment.center,
                        colors: const [Colors.yellow, Colors.red],
                      )
                    : null,
                shape: BoxShape.circle,
              ),
            ),
          ],
        );
      },
    );
  }
}

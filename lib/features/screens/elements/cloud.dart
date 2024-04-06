import 'package:flutter/material.dart';

class Cloud extends StatelessWidget {
  final int color;
  const Cloud({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    Color cloudColor = Colors.white;
    switch (color) {
      case 1:
        cloudColor = Colors.grey;
      case 2:
        cloudColor = Colors.black;
      default:
        cloudColor = Colors.white;
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double base = constraints.maxHeight >= constraints.maxWidth
            ? constraints.maxWidth
            : constraints.maxHeight;
        double bigBulbDiametr = 0.5 * base;
        double mediumBulbDiametr = 0.4 * base;
        double smallBulbDiametr = 0.3 * base;
        double containerWidth =
            base - 0.5 * (mediumBulbDiametr + smallBulbDiametr);

        return Stack(alignment: Alignment.center, children: [
          SizedBox(
            width: base,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0.5 * base,
                  left: 0.5 * mediumBulbDiametr,
                  child: Container(
                    height: smallBulbDiametr,
                    width: containerWidth,
                    color: cloudColor,
                  ),
                ),
                Positioned(
                  top: 0.5 * base - (mediumBulbDiametr - smallBulbDiametr),
                  left: 0,
                  child: Container(
                    height: mediumBulbDiametr,
                    width: mediumBulbDiametr,
                    decoration: BoxDecoration(
                      color: cloudColor,
                      shape: BoxShape.circle,
                    ),
                    child: const SizedBox(),
                  ),
                ),
                Positioned(
                  top: 0.5 * base - 0.6 * bigBulbDiametr,
                  left: 0.35 * mediumBulbDiametr,
                  child: Container(
                    height: bigBulbDiametr,
                    width: bigBulbDiametr,
                    decoration: BoxDecoration(
                      color: cloudColor,
                      shape: BoxShape.circle,
                    ),
                    child: const SizedBox(),
                  ),
                ),
                Positioned(
                  top: 0.5 * base - 0.5 * mediumBulbDiametr,
                  left: base - 1.8 * smallBulbDiametr,
                  child: Container(
                    height: mediumBulbDiametr,
                    width: mediumBulbDiametr,
                    decoration: BoxDecoration(
                      color: cloudColor,
                      shape: BoxShape.circle,
                    ),
                    child: const SizedBox(),
                  ),
                ),
                Positioned(
                  top: 0.5 * base,
                  right: 0,
                  child: Container(
                    height: smallBulbDiametr,
                    width: smallBulbDiametr,
                    decoration: BoxDecoration(
                      color: cloudColor,
                      shape: BoxShape.circle,
                    ),
                    child: const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }
}

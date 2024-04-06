import 'package:flutter/material.dart';

class Termometer extends StatelessWidget {
  final bool maxTemp;

  const Termometer({super.key, required this.maxTemp});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double bulbDiametr;
        if (constraints.maxHeight >= constraints.maxWidth) {
          if (0.35 * constraints.maxHeight > constraints.maxWidth) {
            bulbDiametr = constraints.maxWidth;
          } else {
            bulbDiametr = 0.4 * constraints.maxHeight;
          }
        } else {
          bulbDiametr = 0.4 * constraints.maxHeight;
        }
        double stickHeight = 2.5 * bulbDiametr;
        double stickWidth = 0.4 * bulbDiametr;
        double innerPadding = 0.25 * bulbDiametr;

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: stickHeight,
              width: stickWidth,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(0.5 * stickWidth),
              ),
            ),
            Positioned(
              top: 0.5 * (constraints.maxHeight + stickHeight) - bulbDiametr,
              left: 0.5 * (constraints.maxWidth - bulbDiametr),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: bulbDiametr,
                    width: bulbDiametr,
                    decoration: BoxDecoration(
                      // color: maxTemp != null ? null : Colors.amber,
                      gradient: maxTemp
                          ? const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.yellow, Colors.red])
                          : const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.yellow, Colors.white]),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: bulbDiametr - innerPadding,
                    width: bulbDiametr - innerPadding,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: stickHeight - innerPadding,
                  width: stickWidth - innerPadding,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                        0.5 * (stickHeight - innerPadding)),
                  ),
                ),
                Container(
                  height:
                      (maxTemp ? 0.25 : 0.65) * (stickHeight - innerPadding),
                  width: stickWidth - innerPadding,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(0.5 * (stickHeight - innerPadding)),
                      topRight:
                          Radius.circular(0.5 * (stickHeight - innerPadding)),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

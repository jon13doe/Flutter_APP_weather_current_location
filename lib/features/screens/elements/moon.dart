import 'package:flutter/material.dart';

class Moon extends StatelessWidget {
  const Moon({super.key});

  @override
  Widget build(BuildContext context) {
    double shadowMove = 25;
    
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double bulbDiametr = 0.5 * constraints.maxHeight;

        return Stack(
          alignment: Alignment.center,
          children: [
          Container(
            height: bulbDiametr,
            width: bulbDiametr,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0.5 * constraints.maxHeight - bulbDiametr - shadowMove,
                  left: 0.25 * constraints.maxWidth + shadowMove,
                  child: Container(
                    height: bulbDiametr,
                    width: bulbDiametr,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
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

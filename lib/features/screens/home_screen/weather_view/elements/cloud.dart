import 'dart:math';

import 'package:flutter/material.dart';

class Cloud extends StatefulWidget {
  final int color;
  const Cloud({
    super.key,
    this.color = 0,
  });

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: constraints.maxHeight *
              (4 -
                  4 * sin(pi * (1 - 11 / 12)) +
                  5 +
                  5 * sin(pi / 12) +
                  4 * sin(pi / 4) +
                  5 * cos(pi / 12) +
                  3) /
              13,
          child: ClipPath(
            clipper: CloudClipper(),
            child: Container(
              color: cloudColor(color: widget.color),
            ),
          ),
        );
      },
    );
  }

  cloudColor({required int color}) {
    switch (color) {
      case 1:
        return Colors.grey;
      case 2:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}

class CloudClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double bigBulbR = (5 / 13) * size.height;
    double mediumBulbR = (4 / 13) * size.height;
    double smallBulbR = (3 / 13) * size.height;

    path.moveTo(mediumBulbR, size.height);

    double firstBulbStartAngle = 0.5 * pi;
    double firstBulbSweepAngle = (11 / 12) * pi;

    path.arcTo(
        Rect.fromCircle(
            center: Offset(mediumBulbR, size.height - mediumBulbR),
            radius: mediumBulbR),
        firstBulbStartAngle,
        firstBulbSweepAngle,
        false);

    double bigBulbStartAngle = pi;
    double bigBulbCenterX =
        mediumBulbR * (1 - sin(pi - firstBulbSweepAngle)) + bigBulbR;
    double bigBulbCenterY = size.height - 2 * mediumBulbR;
    double bigBulbSweepAngle = (10 / 12) * pi;

    path.arcTo(
        Rect.fromCircle(
            center: Offset(bigBulbCenterX, bigBulbCenterY), radius: bigBulbR),
        bigBulbStartAngle,
        bigBulbSweepAngle,
        false);

    double medBulbStartAngle = (17 / 12) * pi;
    double medBulbCenterX = bigBulbCenterX +
        bigBulbR * cos(pi - bigBulbSweepAngle) +
        mediumBulbR * sin(medBulbStartAngle + 1.5 * pi);
    double medBulbCentery = bigBulbCenterY -
        bigBulbR * sin(pi - bigBulbSweepAngle) -
        mediumBulbR * cos(medBulbStartAngle + 1.5 * pi);
    double medBulbSweepAngle = (10 / 12) * pi;

    path.arcTo(
        Rect.fromCircle(
            center: Offset(medBulbCenterX, medBulbCentery),
            radius: mediumBulbR),
        medBulbStartAngle,
        medBulbSweepAngle,
        false);

    path.arcTo(
        Rect.fromCircle(
            center: Offset(size.width - smallBulbR, size.height - smallBulbR),
            radius: smallBulbR),
        1.5 * pi,
        pi,
        false);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

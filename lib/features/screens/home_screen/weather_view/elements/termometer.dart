import 'dart:math';

import 'package:flutter/material.dart';

class Termometer extends StatefulWidget {
  const Termometer({super.key});

  @override
  State<Termometer> createState() => _TermometState();
}

class _TermometState extends State<Termometer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 7))
          ..repeat(reverse: true);

    _animation = Tween(
      begin: 0.8,
      end: 0.2,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: ExternalTermometerClipper(),
              child: Container(
                height: constraints.maxHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      tileMode: TileMode.repeated,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        _animation.value - 0.5,
                        _animation.value,
                        _animation.value + 0.5,
                      ],
                      colors: const [
                        Colors.yellow,
                        Colors.orange,
                        Colors.deepOrange,
                      ]),
                ),
              ),
            ),
            ClipPath(
              clipper: InnerTermometerClipper(),
              child: Container(
                color: Colors.white,
                height: constraints.maxHeight,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: constraints.maxHeight / 2,
                    width: constraints.maxWidth,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ExternalTermometerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double buldRadius = size.height / 6;
    double smallRadius = buldRadius / 3;

    path.moveTo(0.5 * size.width - smallRadius, smallRadius);

    path.arcTo(
      Rect.fromCircle(
          center: Offset(0.5 * size.width, smallRadius), radius: smallRadius),
      pi,
      pi,
      false,
    );

    path.arcTo(
        Rect.fromCircle(
            center: Offset(0.5 * size.width, size.height - buldRadius),
            radius: buldRadius),
        1.6 * pi,
        1.8 * pi,
        false);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class InnerTermometerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int dif = 7;

    Path path = Path();

    double buldRadius = size.height / 6;
    double smallRadius = buldRadius / 3;

    path.moveTo(0.5 * size.width - smallRadius + dif, smallRadius);

    path.arcTo(
      Rect.fromCircle(
          center: Offset(0.5 * size.width, smallRadius),
          radius: smallRadius - dif),
      pi,
      pi,
      false,
    );

    path.arcTo(
        Rect.fromCircle(
            center: Offset(0.5 * size.width, size.height - buldRadius),
            radius: buldRadius - dif),
        1.6 * pi,
        1.8 * pi,
        false);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

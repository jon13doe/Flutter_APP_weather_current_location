import 'dart:math';

import 'package:flutter/material.dart';

class Drop extends StatefulWidget {
  const Drop({
    super.key,
  });

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat(reverse: true);

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
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
        return ClipPath(
          clipper: DropClipper(),
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
                    Color.fromARGB(255, 207, 235, 248),
                    Color.fromARGB(255, 156, 210, 255),
                    Color.fromARGB(255, 0, 94, 255),
                  ]),
            ),
          ),
        );
      },
    );
  }
}

class DropClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double buldRadius = size.height / 3;
    double ang = acos(buldRadius / (size.height - buldRadius));

    path.moveTo(0.5 * size.width, 0);

    path.arcTo(
      Rect.fromCircle(
          center: Offset(0.5 * size.width, size.height - buldRadius),
          radius: buldRadius),
      3 * pi / 2 + ang,
      2 * (pi - ang),
      // 2 * (pi - ang * pi / 180),
      false,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

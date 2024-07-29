import 'package:flutter/material.dart';

class Thunder extends StatefulWidget {
  const Thunder({
    super.key,
  });

  @override
  State<Thunder> createState() => _ThunderState();
}

class _ThunderState extends State<Thunder> with SingleTickerProviderStateMixin {
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
          clipper: ThunderClipper(),
          child: Container(
            height: constraints.maxHeight,
            width: 0.5 * constraints.maxHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  tileMode: TileMode.repeated,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    _animation.value - 0.5,
                    _animation.value + 0.5,
                  ],
                  colors: const [
                    Colors.yellow,
                    Colors.yellowAccent,
                  ]),
            ),
          ),
        );
      },
    );
  }
}

class ThunderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0.2 * size.width, 0);
    path.lineTo(0, 0.55 * size.height);
    path.lineTo(0.5 * size.width, 0.55 * size.height);
    path.lineTo(0.3 * size.width, size.height);
    path.lineTo(size.width, 0.35 * size.height);
    path.lineTo(0.6 * size.width, 0.35 * size.height);
    path.lineTo(0.8 * size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

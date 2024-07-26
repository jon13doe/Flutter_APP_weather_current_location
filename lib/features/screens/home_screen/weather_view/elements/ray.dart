import 'package:flutter/material.dart';

class Ray extends StatefulWidget {
  final bool gradient;
  final double height;
  final double width;

  const Ray({
    super.key,
    required this.gradient,
    required this.height,
    required this.width,
  });

  @override
  State<Ray> createState() => _RayState();
}

class _RayState extends State<Ray> with SingleTickerProviderStateMixin {
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
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.width / 2),
        color: widget.gradient ? null : Colors.amber,
        gradient: widget.gradient
            ? LinearGradient(
                tileMode: TileMode.repeated,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [_animation.value - 0.5, _animation.value + 0.5],
                colors: const [Colors.yellow, Colors.red])
            : null,
      ),
    );
  }
}

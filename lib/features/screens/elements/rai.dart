import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({super.key});

  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<Offset> _offsets = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();

    _initializeOffsets();
  }

  void _initializeOffsets() {
    _offsets = List.generate(
      10,
      (index) => Offset(
        Random().nextDouble() * 200,
        -50 - Random().nextDouble() * 100,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _offsets
          .map(
            (offset) => Positioned(
              left: offset.dx,
              top: offset.dy * _animation.value + MediaQuery.of(context).size.height * (1 - _animation.value),
              child: Container(
                width: 20,
                height: 20,
                color: Colors.blue,
              ),
            ),
          )
          .toList(),
    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';

class RegularBackground extends StatelessWidget {
  final bool lightTheme;

  const RegularBackground({
    super.key,
    required this.lightTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: const AlignmentDirectional(2.5, -0.125),
        child: Container(
          height: 250,
          width: 250,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.pinkAccent,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(-2.5, -0.125),
        child: Container(
          height: 250,
          width: 250,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.pinkAccent,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(0, -1),
        child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purpleAccent,
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
        ),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';

import 'cloud.dart';
import 'precipitation.dart';

class Sky extends StatefulWidget {
  const Sky({
    super.key,
  });

  @override
  State<Sky> createState() => _SkyState();
}

class _SkyState extends State<Sky> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Container(
              color: Colors.amber,
              height: 0.5 * constraints.maxHeight,
              child: const Cloud(
                color: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                color: Colors.lime,
                width: 0.3 * constraints.maxWidth,
                child: const Precipitation(
                  wind: 66,
                  rain: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

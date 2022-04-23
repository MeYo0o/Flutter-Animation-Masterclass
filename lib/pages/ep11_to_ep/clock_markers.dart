import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  const ClockSecondsTickMarker({
    Key? key,
    required this.seconds,
    required this.radius,
  }) : super(key: key);

  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const height = 12.0;
    final width = seconds % 5 == 0 ? 4.0 : 2.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate((-width / 2), (-height / 2), 0.0)
        ..rotateZ(2 * pi * (seconds / 60))
        ..translate(0.0, (radius - height / 2), 0.0),
      child: Container(
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);

  final int value;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const height = 30.0;
    const width = 40.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        height: height,
        width: width,
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep24/clock_hand.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep24/elapsed_time_text.dart';

import 'clock_markers.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsedTime;
  final double radius;
  const StopwatchRenderer({
    Key? key,
    required this.elapsedTime,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < 60; i++)
          Positioned(
            top: radius,
            left: radius,
            child: ClockSecondsTickMarker(seconds: i, radius: radius),
          ),
        for (int i = 5; i <= 60; i += 5)
          Positioned(
            top: radius,
            left: radius,
            child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
          ),
        Positioned(
          top: radius,
          left: radius,
          // right: radius,
          child: ClockHand(
            handLength: radius,
            handThickness: 2,
            rotationZAngle: pi + (2 * pi / 60000) * elapsedTime.inMilliseconds,
            color: Colors.orange,
          ),
        ),
        Positioned(
          top: radius * 1.3,
          left: 0,
          right: 0,
          child: ElapsedTimeText(elapsed: elapsedTime),
        ),
      ],
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/clock_hand.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/elapsed_time_text.dart';

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
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        Positioned(
          top: radius,
          left: radius,
          // right: radius,
          child: ClockHand(
            handLength: radius,
            handThickness: 2,
            rotationZAngle:
                pi + (2 * pi / 60000) * elapsedTime.inMilliseconds,
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

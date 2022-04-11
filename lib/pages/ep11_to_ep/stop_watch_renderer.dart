import 'package:flutter/material.dart';

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
        // ElapsedTimeText(elapsed: elapsedTime),
      ],
    );
  }
}

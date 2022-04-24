import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_animations_masterclass/pages/ep25_to_ep/ui/theming/app_theme.dart';

class TaskCompletionRing extends StatelessWidget {
  const TaskCompletionRing({
    Key? key,
    required this.progress,
  }) : super(key: key);
  final double progress;

  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.of(context);
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: CustomPaint(
        painter: RingPainter(
          progress: progress,
          taskCompletedColor: themeData.accent,
          taskNotCompletedColor: themeData.taskRing,
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  final double progress;
  final Color taskCompletedColor;
  final Color taskNotCompletedColor;
  RingPainter({
    required this.progress,
    required this.taskCompletedColor,
    required this.taskNotCompletedColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15.0;
    final c = Offset(size.width / 2, size.height / 2);
    final r = (size.width - strokeWidth) / 2;
    final circleBGPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskNotCompletedColor
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(c, r, circleBGPaint);

    final circleFGPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskCompletedColor
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: r),
      -pi / 2,
      2 * pi * progress,
      false,
      circleFGPaint,
    );
  }

  @override
  bool shouldRepaint(RingPainter oldDelegate) =>
      oldDelegate.progress != progress;

  // @override
  // bool shouldRebuildSemantics(RingPainter oldDelegate) =>
  //     oldDelegate.progress != progress;
}

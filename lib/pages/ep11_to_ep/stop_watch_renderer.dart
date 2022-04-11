import 'package:flutter/material.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsedTime;
  const StopwatchRenderer({
    Key? key,
    required this.elapsedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeText(elapsed: elapsedTime);
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/elapsed_time_text.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/stop_watch_renderer.dart';

class MeYoStopWatch extends StatefulWidget {
  const MeYoStopWatch({Key? key}) : super(key: key);

  @override
  State<MeYoStopWatch> createState() => _MeYoStopWatchState();
}

class _MeYoStopWatchState extends State<MeYoStopWatch> with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(
      (elapsed) {
        setState(
          () {
            _elapsed = elapsed;
          },
        );
      },
    );

    //Tickers have to be started explicitly
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(50.0, 0.0, 0.0)
            ..rotateZ(pi / 4),
          // transform: Matrix4.translationValues(50.0, 0, 0) * Matrix4.rotationZ(pi / 4),
          child: Container(
            color: Colors.indigo,
          ),
        ),
        // StopwatchRenderer(
        //   elapsedTime: _elapsed,
        // ),
      ],
    );
  }
}

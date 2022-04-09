import 'package:flutter/material.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/elapsed_time_text_basic.dart';

class MeYoStopWatch extends StatefulWidget {
  const MeYoStopWatch({Key? key}) : super(key: key);

  @override
  State<MeYoStopWatch> createState() => _MeYoStopWatchState();
}

class _MeYoStopWatchState extends State<MeYoStopWatch> {
  @override
  Widget build(BuildContext context) {
    return const ElapsedTimeTextBasic(
      elapsed: Duration(seconds: 5),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/elapsed_time_text_basic.dart';

class MeYoStopWatch extends StatefulWidget {
  const MeYoStopWatch({Key? key}) : super(key: key);

  @override
  State<MeYoStopWatch> createState() => _MeYoStopWatchState();
}

class _MeYoStopWatchState extends State<MeYoStopWatch> {
  late DateTime _initialTime;
  late Timer _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initialTime = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      setState(() {
        _elapsed = DateTime.now().difference(_initialTime);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeTextBasic(
      elapsed: _elapsed,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/reset_button.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/start_stop_button.dart';
import 'package:flutter_animations_masterclass/pages/ep11_to_ep/stop_watch_renderer.dart';

class MeYoStopWatch extends StatefulWidget {
  const MeYoStopWatch({Key? key}) : super(key: key);

  @override
  State<MeYoStopWatch> createState() => _MeYoStopWatchState();
}

class _MeYoStopWatchState extends State<MeYoStopWatch>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  bool _isRunning = false;
  Duration _currentTime = Duration.zero;
  Duration _previousTime = Duration.zero;
  Duration get _elapsedTime => _previousTime + _currentTime;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentTime = elapsed;
      });
    });

    //Tickers have to be started explicitly -- stopped by default.
    // _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else if (!_isRunning) {
        _ticker.stop();
        _previousTime += _currentTime;
        _currentTime = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _previousTime = Duration.zero;
      _currentTime = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        // final radius = constrains.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(
              elapsedTime: _elapsedTime,
              radius: constrains.maxWidth / 2,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 80,
                width: 80,
                child: ResetButton(
                  onPressed: _reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 80,
                width: 80,
                child: StartStopButton(
                  isRunning: _isRunning,
                  onPressed: _toggleRunning,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

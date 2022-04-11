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
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
      });
    });

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
    return LayoutBuilder(
      builder: (context, constrains) {
        // final radius = constrains.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(
              elapsedTime: _elapsed,
              radius: constrains.maxWidth / 2,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 80,
                width: 80,
                child: ResetButton(
                  onPressed: () {},
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 80,
                width: 80,
                child: StartStopButton(
                  isRunning: true,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

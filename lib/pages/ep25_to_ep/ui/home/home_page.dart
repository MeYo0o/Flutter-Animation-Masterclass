import 'package:flutter/material.dart';
import 'package:flutter_animations_masterclass/pages/ep25_to_ep/ui/task/animated_task.dart';

import '../task/task_completion_ring.dart';
import '../theming/app_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: Center(
        child: SizedBox(
          width: 240,
          child: AnimatedTask(),
        ),
      ),
    );
  }
}

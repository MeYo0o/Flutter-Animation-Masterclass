import 'package:flutter/material.dart';

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
          child: TaskCompletionRing(progress: 0.4),
        ),
      ),
    );
  }
}

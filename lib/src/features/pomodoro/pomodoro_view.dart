import 'package:flutter/material.dart';

part 'pomodoro_mixin.dart';

class PomodoroView extends StatefulWidget {
  const PomodoroView({super.key});

  @override
  State<PomodoroView> createState() => _PomodoroViewState();
}

class _PomodoroViewState extends State<PomodoroView> with PomodoroMixin {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

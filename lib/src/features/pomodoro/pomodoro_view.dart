import 'package:flutter/material.dart';
import 'package:root/src/core/logger/logger.dart';
import 'package:root/src/features/pomodoro/pomodoro_viewmodel.dart';
import 'package:root/src/repositories/productivity_project_repository.dart';

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

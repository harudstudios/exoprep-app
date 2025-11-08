import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:root/src/models/project_model/project_model.dart';

class PomodoroTimerScreen extends StatefulWidget {
  const PomodoroTimerScreen({required this.projectModel, super.key});

  final ProjectModel projectModel;

  @override
  State<PomodoroTimerScreen> createState() => _PomodoroTimerScreenState();
}

class _PomodoroTimerScreenState extends State<PomodoroTimerScreen> {
  static const platform = MethodChannel('com.harud.exampyq.exam_pyq/timer');

  int _remainingSeconds = 25 * 60;
  bool _isRunning = false;
  Timer? _timer;

  String _projectName = "Focus Session";
  Color _projectColor = Colors.red;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _projectColor = Color(widget.projectModel.tagColor);
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    try {
      await platform.invokeMethod('requestPermissions');
    } on PlatformException catch (e) {
      print("Failed to request permissions: ${e.message}");
    }
  }

  Future<void> _startTimer() async {
    setState(() => _isRunning = true);

    try {
      await platform.invokeMethod('startTimer', {
        'totalSeconds': _remainingSeconds,
        'projectName': _projectName,
        'projectColor': _projectColor.value.toRadixString(16).substring(2),
      });
    } on PlatformException catch (e) {
      print("Failed to start timer: ${e.message}");
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _stopTimer();
      }
    });
  }

  Future<void> _pauseTimer() async {
    setState(() => _isRunning = false);
    _timer?.cancel();

    try {
      await platform.invokeMethod('pauseTimer');
    } on PlatformException catch (e) {
      print("Failed to pause timer: ${e.message}");
    }
  }

  Future<void> _stopTimer() async {
    setState(() {
      _isRunning = false;
      _remainingSeconds = 25 * 60;
    });
    _timer?.cancel();

    try {
      await platform.invokeMethod('stopTimer');
    } on PlatformException catch (e) {
      print("Failed to stop timer: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_remainingSeconds / 60).floor();
    final seconds = _remainingSeconds % 60;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 280,
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 280,
                    height: 280,
                    child: CircularProgressIndicator(
                      value: _remainingSeconds / (25 * 60),
                      strokeWidth: 12,
                      backgroundColor: Colors.grey[800],
                      valueColor: AlwaysStoppedAnimation(_projectColor),
                    ),
                  ),
                  Text(
                    '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _isRunning ? _pauseTimer : _startTimer,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: _projectColor, width: 4),
                    ),
                    child: Icon(
                      _isRunning ? Icons.pause : Icons.play_arrow,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(width: 30),

                GestureDetector(
                  onTap: _stopTimer,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 4),
                    ),
                    child: const Icon(
                      Icons.stop,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

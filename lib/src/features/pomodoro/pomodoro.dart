import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:root/src/core/extensions/string_extensions.dart';
import 'package:root/src/models/project_model/project_model.dart';
import 'package:root/src/services/pomodoro_service.dart';

class PomodoroTimerScreen extends StatefulWidget {
  const PomodoroTimerScreen({required this.projectModel, super.key});

  final ProjectModel projectModel;

  @override
  State<PomodoroTimerScreen> createState() => _PomodoroTimerScreenState();
}

class _PomodoroTimerScreenState extends State<PomodoroTimerScreen> {
  static const platform = MethodChannel('com.harud.exampyq.exam_pyq/timer');
  static const eventChannel = EventChannel(
    'com.harud.exampyq.exam_pyq/timer_events',
  );

  int _remainingSeconds = 25 * 60;
  bool _isRunning = false;
  Timer? _timer;
  StreamSubscription? _eventSubscription;
  String? _currentSessionId;

  String _projectName = "Focus Session";
  Color _projectColor = Colors.red;

  @override
  void dispose() {
    _timer?.cancel();
    _eventSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _projectColor = Color(widget.projectModel.tagColor);
    _projectName = widget.projectModel.projectName
        .toString()
        .capitalizeEachWord();
    _requestPermissions();
    _listenToTimerEvents();

    // Check for pending sessions when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkPendingSession();
    });
  }

  Future<void> _requestPermissions() async {
    try {
      await platform.invokeMethod('requestPermissions');
    } on PlatformException catch (e) {
      log("Failed to request permissions: ${e.message}");
    }
  }

  Future<void> _checkPendingSession() async {
    try {
      final dynamic result = await platform.invokeMethod('getPendingSession');
      final sessionData = Map<dynamic, dynamic>.from(
        result as Map,
      );

      final isActive = sessionData['isActive'] as bool? ?? false;
      final timeSpent = sessionData['timeSpent'] as int? ?? 0;
      final sessionId = sessionData['sessionId'] as String? ?? '';
      final projectName =
          sessionData['projectName'] as String? ?? 'Focus Session';

      if (!mounted) return;

      if (isActive && sessionId.isNotEmpty) {
        log('📦 Found pending session: $sessionId - ${timeSpent}s spent');

        // Check if session qualifies as complete (24+ minutes = 1440+ seconds)
        if (timeSpent >= 1440) {
          await _showCompletedSessionDialog(
            sessionId: sessionId,
            timeSpent: timeSpent,
            projectName: projectName,
          );
        } else {
          await _showIncompleteSessionDialog(
            sessionId: sessionId,
            timeSpent: timeSpent,
            projectName: projectName,
          );
        }
      }
    } catch (e) {
      log('❌ Error checking pending session: $e');
    }
  }

  Future<void> _showCompletedSessionDialog({
    required String sessionId,
    required int timeSpent,
    required String projectName,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('🎉 Session Completed!'),
        content: Text(
          'Great work! You completed a focus session for "$projectName".\n\n'
          'Duration: ${(timeSpent / 60).floor()} minutes',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              // TODO: Save to Isar database
              await _saveCompletedSessionToIsar(sessionId, timeSpent);
              // Clear from SharedPreferences
              await platform.invokeMethod('clearPendingSession');
            },
            child: const Text('Save Session'),
          ),
        ],
      ),
    );
  }

  Future<void> _showIncompleteSessionDialog({
    required String sessionId,
    required int timeSpent,
    required String projectName,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('⏱️ Pending Session Found'),
        content: Text(
          'You have an incomplete focus session for "$projectName".\n\n'
          'Time spent: ${(timeSpent / 60).floor()} minutes\n\n'
          'What would you like to do?',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              // Discard the session
              await platform.invokeMethod('clearPendingSession');
            },
            child: const Text('Discard', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              // TODO: Save partial session to Isar
              await _savePartialSessionToIsar(sessionId, timeSpent);
              // Clear from SharedPreferences
              await platform.invokeMethod('clearPendingSession');
            },
            child: const Text('Save Anyway'),
          ),
        ],
      ),
    );
  }

  // TODO: Implement these functions with your Isar logic
  Future<void> _saveCompletedSessionToIsar(
    String sessionId,
    int timeSpent,
  ) async {
    log('💾 Saving completed session: $sessionId - ${timeSpent}s');
    // Your Isar save logic here
    // Example:
    // final session = await isar.sessions.get(sessionId);
    // session.timeSpent = timeSpent;
    // session.isCompleted = true;
    // await isar.writeTxn(() => isar.sessions.put(session));
  }

  Future<void> _savePartialSessionToIsar(
    String sessionId,
    int timeSpent,
  ) async {
    log('💾 Saving partial session: $sessionId - ${timeSpent}s');
    // Your Isar save logic here
  }

  void _listenToTimerEvents() {
    _eventSubscription = eventChannel.receiveBroadcastStream().listen(
      (event) {
        log("📱 Flutter received event: $event");

        if (event is Map) {
          // Handle pause/resume
          if (event.containsKey('isPaused')) {
            final isPaused = event['isPaused'] as bool;
            log("📱 Extracted isPaused: $isPaused");

            setState(() {
              _isRunning = !isPaused;
            });

            if (isPaused) {
              log("⏸️ Pausing local timer");
              _timer?.cancel();
            } else {
              log("▶️ Starting local timer");
              _startLocalTimer();
            }
          }

          // Handle stop
          if (event.containsKey('stopped') && event['stopped'] == true) {
            final timeSpent = event['timeSpent'] as int? ?? 0;
            final sessionId = event['sessionId'] as String?;
            log("🛑 Timer stopped from notification - Time: ${timeSpent}s");

            setState(() {
              _isRunning = false;
              _remainingSeconds = 25 * 60;
            });
            _timer?.cancel();

            // TODO: Save to Isar
            if (sessionId != null) {
              _saveCompletedSessionToIsar(sessionId, timeSpent);
            }
          }

          // Handle completion
          if (event.containsKey('completed') && event['completed'] == true) {
            final timeSpent = event['timeSpent'] as int? ?? 0;
            final sessionId = event['sessionId'] as String?;
            log("✅ Timer completed - Time: ${timeSpent}s");

            setState(() {
              _isRunning = false;
              _remainingSeconds = 25 * 60;
            });
            _timer?.cancel();

            // TODO: Save to Isar
            if (sessionId != null) {
              _saveCompletedSessionToIsar(sessionId, timeSpent);
            }

            // Show completion message
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('🎉 Focus session completed!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          }
        }
      },
      onError: (error) {
        log("❌ Error in event channel: $error");
      },
    );
  }

  void _startLocalTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _stopTimer();
      }
    });
  }

  Future<void> _startTimer() async {
    final sessionId = DateTime.now().millisecondsSinceEpoch.toString();

    final success = await PomodoroService.startTimer(
      totalSeconds: _remainingSeconds,
      projectName: _projectName,
      projectColor: _projectColor.value.toRadixString(16).substring(2),
      sessionId: sessionId,
    );

    await PomodoroService.clearPendingSession();

    if (success) {
      setState(() => _isRunning = true);
      _startLocalTimer();
    }
  }

  Future<void> _pauseTimer() async {
    await PomodoroService.pauseTimer();
    setState(() => _isRunning = false);
    _timer?.cancel();
  }

  Future<void> _stopTimer() async {
    await PomodoroService.stopTimer();
    setState(() {
      _isRunning = false;
      _remainingSeconds = 25 * 60;
    });
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_remainingSeconds / 60).floor();
    final seconds = _remainingSeconds % 60;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E2E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _projectName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
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

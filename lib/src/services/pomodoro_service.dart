import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PomodoroService {
  static const platform = MethodChannel('com.harud.exampyq.exam_pyq/timer');
  static const eventChannel = EventChannel(
    'com.harud.exampyq.exam_pyq/timer_events',
  );

  // ==================== TIMER CONTROL METHODS ====================

  /// Start a new timer session
  static Future<bool> startTimer({
    required int totalSeconds,
    required String projectName,
    required String projectColor,
    required String sessionId,
  }) async {
    try {
      await platform.invokeMethod('startTimer', {
        'totalSeconds': totalSeconds,
        'projectName': projectName,
        'projectColor': projectColor,
        'sessionId': sessionId,
      });
      log('✅ Timer started: $sessionId');
      return true;
    } on PlatformException catch (e) {
      log('❌ Failed to start timer: ${e.message}');
      return false;
    }
  }

  /// Pause/Resume the timer
  static Future<bool> pauseTimer() async {
    try {
      await platform.invokeMethod('pauseTimer');
      log('⏸️ Timer paused/resumed');
      return true;
    } on PlatformException catch (e) {
      log('❌ Failed to pause timer: ${e.message}');
      return false;
    }
  }

  /// Stop the timer
  static Future<bool> stopTimer() async {
    try {
      await platform.invokeMethod('stopTimer');
      log('⏹️ Timer stopped');
      return true;
    } on PlatformException catch (e) {
      log('❌ Failed to stop timer: ${e.message}');
      return false;
    }
  }

  /// Request notification permissions
  static Future<bool> requestPermissions() async {
    try {
      await platform.invokeMethod('requestPermissions');
      log('✅ Permissions requested');
      return true;
    } on PlatformException catch (e) {
      log('❌ Failed to request permissions: ${e.message}');
      return false;
    }
  }

  // ==================== SESSION DATA METHODS ====================

  /// Get pending session data
  static Future<PomodoroSessionData?> getPendingSession() async {
    try {
      final dynamic result = await platform.invokeMethod('getPendingSession');
      final sessionData = Map<dynamic, dynamic>.from(result as Map);

      final isActive = sessionData['isActive'] as bool? ?? false;
      final timeSpent = sessionData['timeSpent'] as int? ?? 0;
      final sessionId = sessionData['sessionId'] as String? ?? '';
      final projectName =
          sessionData['projectName'] as String? ?? 'Focus Session';
      final projectColor = sessionData['projectColor'] as String? ?? 'FFFFC107';

      log(
        '📦 Session data received: isActive=$isActive, id=$sessionId, time=${timeSpent}s, name=$projectName',
      );

      // Check if there's any meaningful data
      // Return data if sessionId is not empty OR timeSpent > 0
      if (sessionId.isEmpty && timeSpent == 0) {
        log('ℹ️ No session data found');
        return null;
      }

      log('✅ Found session: $sessionId - ${timeSpent}s');

      return PomodoroSessionData(
        isActive: isActive,
        sessionId: sessionId,
        timeSpent: timeSpent,
        projectName: projectName.isEmpty ? 'Focus Session' : projectName,
        projectColor: projectColor.isEmpty ? 'FFFFC107' : projectColor,
      );
    } catch (e) {
      log('❌ Error getting pending session: $e');
      return null;
    }
  }

  /// Clear pending session data
  static Future<bool> clearPendingSession() async {
    try {
      await platform.invokeMethod('clearPendingSession');
      log('🗑️ Pending session cleared');
      return true;
    } on PlatformException catch (e) {
      log('❌ Failed to clear pending session: ${e.message}');
      return false;
    }
  }

  // ==================== DIALOG HELPERS ====================

  /// Check and show dialog for pending session
  static Future<void> checkAndShowPendingSessionDialog(
    BuildContext context,
  ) async {
    final sessionData = await getPendingSession();

    if (sessionData == null) return;

    if (!context.mounted) return;

    // Check if session qualifies as complete (24+ minutes = 1440+ seconds)
    if (sessionData.timeSpent >= 1440) {
      await _showCompletedSessionDialog(
        context,
        sessionData: sessionData,
      );
    } else {
      await _showIncompleteSessionDialog(
        context,
        sessionData: sessionData,
      );
    }
  }

  static Future<void> _showCompletedSessionDialog(
    BuildContext context, {
    required PomodoroSessionData sessionData,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('🎉 Session Completed!'),
        content: Text(
          'Great work! You completed a focus session for "${sessionData.projectName}".\n\n'
          'Duration: ${(sessionData.timeSpent / 60).floor()} minutes',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              // Clear the pending session
              await clearPendingSession();
              // TODO: You implement - Save to Isar
              // await saveCompletedSessionToIsar(sessionData);
            },
            child: const Text('Save Session'),
          ),
        ],
      ),
    );
  }

  static Future<void> _showIncompleteSessionDialog(
    BuildContext context, {
    required PomodoroSessionData sessionData,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('⏱️ Pending Session Found'),
        content: Text(
          'You have an incomplete focus session for "${sessionData.projectName}".\n\n'
          'Time spent: ${(sessionData.timeSpent / 60).floor()} minutes\n\n'
          'What would you like to do?',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await clearPendingSession();
            },
            child: const Text('Discard', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await clearPendingSession();
              // TODO: You implement - Save to Isar
              // await savePartialSessionToIsar(sessionData);
            },
            child: const Text('Save Anyway'),
          ),
        ],
      ),
    );
  }

  // ==================== EVENT STREAM ====================

  /// Listen to timer events (pause, stop, complete)
  static Stream<PomodoroTimerEvent> get timerEventStream {
    return eventChannel.receiveBroadcastStream().map((event) {
      if (event is! Map) {
        return PomodoroTimerEvent.unknown();
      }

      final eventMap = Map<String, dynamic>.from(event);

      // Parse different event types
      if (eventMap.containsKey('isPaused')) {
        return PomodoroTimerEvent.stateChanged(
          isPaused: eventMap['isPaused'] as bool,
        );
      }

      if (eventMap.containsKey('stopped') && eventMap['stopped'] == true) {
        return PomodoroTimerEvent.stopped(
          timeSpent: eventMap['timeSpent'] as int? ?? 0,
          sessionId: eventMap['sessionId'] as String? ?? '',
        );
      }

      if (eventMap.containsKey('completed') && eventMap['completed'] == true) {
        return PomodoroTimerEvent.completed(
          timeSpent: eventMap['timeSpent'] as int? ?? 0,
          sessionId: eventMap['sessionId'] as String? ?? '',
        );
      }

      return PomodoroTimerEvent.unknown();
    });
  }
}

// ==================== DATA MODELS ====================

class PomodoroSessionData {
  final bool isActive;
  final String sessionId;
  final int timeSpent;
  final String projectName;
  final String projectColor;

  PomodoroSessionData({
    required this.isActive,
    required this.sessionId,
    required this.timeSpent,
    required this.projectName,
    required this.projectColor,
  });

  bool get isCompleted => timeSpent >= 1440; // 24 minutes

  int get timeSpentMinutes => (timeSpent / 60).floor();
}

class PomodoroTimerEvent {
  final PomodoroEventType type;
  final bool? isPaused;
  final int? timeSpent;
  final String? sessionId;

  PomodoroTimerEvent._({
    required this.type,
    this.isPaused,
    this.timeSpent,
    this.sessionId,
  });

  factory PomodoroTimerEvent.stateChanged({required bool isPaused}) {
    return PomodoroTimerEvent._(
      type: PomodoroEventType.stateChanged,
      isPaused: isPaused,
    );
  }

  factory PomodoroTimerEvent.stopped({
    required int timeSpent,
    required String sessionId,
  }) {
    return PomodoroTimerEvent._(
      type: PomodoroEventType.stopped,
      timeSpent: timeSpent,
      sessionId: sessionId,
    );
  }

  factory PomodoroTimerEvent.completed({
    required int timeSpent,
    required String sessionId,
  }) {
    return PomodoroTimerEvent._(
      type: PomodoroEventType.completed,
      timeSpent: timeSpent,
      sessionId: sessionId,
    );
  }

  factory PomodoroTimerEvent.unknown() {
    return PomodoroTimerEvent._(type: PomodoroEventType.unknown);
  }
}

enum PomodoroEventType {
  stateChanged,
  stopped,
  completed,
  unknown,
}

import 'dart:developer';

import 'package:root/src/core/env/env.dart';
import 'package:talker_logger/talker_logger.dart';

/// Centralized logging system for the application
/// Provides structured logging with different levels and formatting
class AppLogs {
  AppLogs._();

  // Color pens for different log levels
  static final _penDebug = AnsiPen()..blue();
  static final _penInfo = AnsiPen()..green(bold: true);
  static final _penWarning = AnsiPen()..yellow(bold: true);
  static final _penError = AnsiPen()..red(bold: true);
  static final _penCritical = AnsiPen()..magenta(bold: true);
  static final _penSuccess = AnsiPen()..xterm(34);
  static final _penVerbose = AnsiPen()..gray();
  static final _penTrace = AnsiPen()..cyan();

  // Emoji icons for visual distinction
  static const Map<LogLevel, String> _icons = {
    LogLevel.info: "ℹ️ ",
    LogLevel.debug: "🐛 ",
    LogLevel.warning: "⚠️ ",
    LogLevel.error: "❌ ",
    LogLevel.critical: "💥 ",
    LogLevel.verbose: "🔍 ",
  };

  // Talker logger instance with configuration
  static final _logger = TalkerLogger(
    settings: TalkerLoggerSettings(
      maxLineWidth: 120,
      colors: {
        LogLevel.info: _penInfo,
        LogLevel.debug: _penDebug,
        LogLevel.warning: _penWarning,
        LogLevel.error: _penError,
        LogLevel.critical: _penCritical,
        LogLevel.verbose: _penVerbose,
      },
    ),
  );

  /// Format log message with timestamp and emoji
  static String _formatMessage(String message, String emoji, [String? tag]) {
    final timestamp = DateTime.now().toIso8601String();
    final environment = Env.current.toUpperCase();
    final tagInfo = tag != null ? '[$tag] ' : '';
    return "[$timestamp][$environment] $emoji $tagInfo$message";
  }

  /*------------ Standard Log Levels ------------*/

  /// Log informational messages
  static void info(String message, [String? tag]) {
    if (_shouldLog(LogLevel.info)) {
      _logger.info(_formatMessage(message, _icons[LogLevel.info]!, tag));
    }
  }

  /// Log debug messages (only in dev environment)
  static void debug(String message, [String? tag]) {
    if (_shouldLog(LogLevel.debug)) {
      _logger.debug(_formatMessage(message, _icons[LogLevel.debug]!, tag));
    }
  }

  /// Log warning messages
  static void warning(String message, [String? tag]) {
    if (_shouldLog(LogLevel.warning)) {
      _logger.warning(_formatMessage(message, _icons[LogLevel.warning]!, tag));
    }
  }

  /// Log error messages
  static void error(String message, [String? tag, Object? error, StackTrace? stackTrace]) {
    if (_shouldLog(LogLevel.error)) {
      final errorInfo = error != null ? ' | Error: $error' : '';
      final stackInfo = stackTrace != null ? ' | Stack: ${stackTrace.toString().split('\n').first}' : '';
      _logger.error(_formatMessage(message + errorInfo + stackInfo, _icons[LogLevel.error]!, tag));
    }
  }

  /// Log critical errors
  static void critical(String message, [String? tag, Object? error, StackTrace? stackTrace]) {
    final errorInfo = error != null ? ' | Error: $error' : '';
    final stackInfo = stackTrace != null ? ' | Stack: ${stackTrace.toString().split('\n').first}' : '';
    _logger.critical(_formatMessage(message + errorInfo + stackInfo, _icons[LogLevel.critical]!, tag));
  }

  /// Log verbose messages (only in dev environment)
  static void verbose(String message, [String? tag]) {
    if (_shouldLog(LogLevel.verbose)) {
      _logger.verbose(_formatMessage(message, _icons[LogLevel.verbose]!, tag));
    }
  }

  /*------------ Custom Log Levels ------------*/

  /// Log success messages
  static void success(String message, [String? tag]) {
    if (_shouldLog(LogLevel.info)) {
      log(_penSuccess(_formatMessage(message, '✅ ', tag)));
    }
  }

  /// Log trace messages (for method entry/exit)
  static void trace(String message, [String? tag]) {
    if (Env.isDev) {
      log(_penTrace(_formatMessage(message, '📌 ', tag)));
    }
  }

  /*------------ Feature-specific Logging ------------*/

  /// Log network requests
  static void network(String message, {String? method, String? url, int? statusCode}) {
    final methodInfo = method != null ? '[$method] ' : '';
    final urlInfo = url != null ? '$url ' : '';
    final statusInfo = statusCode != null ? '(Status: $statusCode) ' : '';
    info('🌐 $methodInfo$urlInfo$statusInfo$message', 'NETWORK');
  }

  /// Log navigation events
  static void navigation(String message, {String? from, String? to}) {
    final routeInfo = from != null && to != null ? '$from → $to: ' : '';
    info('🧭 $routeInfo$message', 'NAVIGATION');
  }

  /// Log authentication events
  static void auth(String message) {
    info('🔐 $message', 'AUTH');
  }

  /// Log database operations
  static void database(String message, {String? operation, String? table}) {
    final operationInfo = operation != null ? '[$operation] ' : '';
    final tableInfo = table != null ? 'Table: $table - ' : '';
    info('💾 $operationInfo$tableInfo$message', 'DATABASE');
  }

  /// Log performance metrics
  static void performance(String message, {Duration? duration}) {
    final durationInfo = duration != null ? ' (${duration.inMilliseconds}ms)' : '';
    info('⏱️ $message$durationInfo', 'PERFORMANCE');
  }

  /// Log user actions for analytics
  static void userAction(String action, {Map<String, dynamic>? properties}) {
    final props = properties != null ? ' | Properties: $properties' : '';
    info('👤 Action: $action$props', 'USER');
  }

  /*------------ Utility Methods ------------*/

  /// Check if logging is enabled for the given level
  static bool _shouldLog(LogLevel level) {
    if (Env.isProd) {
      // In production, only log warnings, errors, and critical messages
      return [LogLevel.warning, LogLevel.error, LogLevel.critical].contains(level);
    }
    // In development and staging, log everything
    return true;
  }

  /// Log method entry (for debugging)
  static void methodEntry(String methodName, [Map<String, dynamic>? parameters]) {
    if (Env.isDev) {
      final params = parameters != null ? ' | Params: $parameters' : '';
      trace('→ Entering $methodName$params', 'METHOD');
    }
  }

  /// Log method exit (for debugging)
  static void methodExit(String methodName, [dynamic result]) {
    if (Env.isDev) {
      final resultInfo = result != null ? ' | Result: $result' : '';
      trace('← Exiting $methodName$resultInfo', 'METHOD');
    }
  }

  /// Log API request/response
  static void apiCall({
    required String endpoint,
    required String method,
    Map<String, dynamic>? requestData,
    dynamic responseData,
    int? statusCode,
    Duration? duration,
  }) {
    final request = requestData != null ? ' | Request: $requestData' : '';
    final response = responseData != null ? ' | Response: $responseData' : '';
    final status = statusCode != null ? ' | Status: $statusCode' : '';
    final time = duration != null ? ' | Duration: ${duration.inMilliseconds}ms' : '';
    
    network('$method $endpoint$request$response$status$time');
  }
}

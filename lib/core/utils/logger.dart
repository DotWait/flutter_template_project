import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
    level: kReleaseMode ? Level.off : Level.trace,
  );

  // trace 不支持 error 和 stackTrace 参数，只能拼接成 message
  static void t(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    final traceMsg = _formatMessage(message, error, stackTrace);
    _logger.t(traceMsg);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.d(_formatMessage(message, error, stackTrace));

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.i(_formatMessage(message, error, stackTrace));

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.w(_formatMessage(message, error, stackTrace));

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(_formatMessage(message, error, stackTrace));

  static void f(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.f(_formatMessage(message, error, stackTrace));

  static String _formatMessage(dynamic message, dynamic error, StackTrace? stackTrace) {
    final buffer = StringBuffer();
    buffer.writeln(message);
    if (error != null) buffer.writeln('Error: $error');
    if (stackTrace != null) buffer.writeln('StackTrace:\n$stackTrace');
    return buffer.toString();
  }
}

final logger = AppLogger;

// logger.t('Trace 日志');
// logger.e('发生错误', Exception('Some error'), StackTrace.current);

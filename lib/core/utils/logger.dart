import 'package:logger/logger.dart';

/*
常用日志等级说明
| 日志等级  | emoji 示例   | 常用场景说明           |
| ----- | ---------- | ---------------- |
| `v`   | 💜 VERBOSE | 最详细日志，如底层回调/调试值  |
| `d`   | 💚 DEBUG   | 开发过程中的调试日志       |
| `i`   | 💙 INFO    | 一般信息，例如状态变化      |
| `w`   | 💛 WARNING | 非致命警告，如配置缺失等     |
| `e`   | ❤️ ERROR   | 错误、崩溃等重要问题       |
| `wtf` | 🧨 WTF     | 非常严重的错误（例如未捕获异常） |
*/

/// 日志工具类封装
class AppLogger {
  static late final Logger _logger;

  static late String _logDir;
  static late Level _minLogLevel;

  /// 初始化日志系统
  static void init({
    Level level = Level.debug,
  }) {
    _minLogLevel = level;

    final outputs = <LogOutput>[ConsoleOutput()];

    _logger = Logger(
      filter: _CustomLogFilter(_minLogLevel),
      printer: PrettyPrinter(
        methodCount: 2, // 展示调用栈的层数，0 表示不展示
        errorMethodCount: 8, // 异常时展示的调用栈层数
        lineLength: 120, // 单行最大字符数，超过会自动换行
        colors: true, // 是否启用彩色输出（推荐开启，调试更清晰）
        printEmojis: true, // 是否在日志前添加 emoji，例如❗️💡等
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart, // 推荐：显示时间 + 自应用启动以来的时间差
        noBoxingByDefault: false, // 为 true 时，默认不加边框，除非通过 excludeBox 指定需要框的等级
      ),
      output: MultiOutput(outputs),  // 暂时只输出到控制台，如需输出到文件，在outputs增加即可
    );
  }

  static void t(dynamic message) => _logger.t(message);
  static void d(dynamic message) => _logger.d(message);
  static void i(dynamic message) => _logger.i(message);
  static void w(dynamic message) => _logger.w(message);
  static void e(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);

}

/// 自定义日志等级过滤器
class _CustomLogFilter extends LogFilter {
  final Level minLevel;

  _CustomLogFilter(this.minLevel);

  @override
  bool shouldLog(LogEvent event) {
    return event.level.index >= minLevel.index;
  }
}
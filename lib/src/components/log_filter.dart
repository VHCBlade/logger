part of logger;

/// An abstract filter of log messages.
///
/// You can implement your own `LogFilter` or use [DebugFilter].
/// Every implementation should consider [Logger.level].
abstract class LogFilter {
  /// Is called every time a new log message is sent and decides if
  /// it will be printed or canceled.
  ///
  /// Returns `true` if the message should be logged.
  bool shouldLog(Level level, dynamic message,
      [dynamic error, StackTrace stackTrace]);

  void dispose() {}
}
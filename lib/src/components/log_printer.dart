part of logger;

/// An abstract handler of log messages.
///
/// A log printer creates the output, which is then sent to [LogOutput].
///
/// You can implement a `LogPrinter` from scratch or extend [PrettyPrinter].
abstract class LogPrinter {

  /// Is called every time a new log message is sent and handles printing or
  /// storing the message.
  Future<List<String>> log(Level level, dynamic message, dynamic error, StackTrace stackTrace);

  void dispose() {}
}
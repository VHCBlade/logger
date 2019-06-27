part of logger;

/// Log output receives the log lines from [LogPrinter] and sends it to the
/// desired destination.
///
/// This can be an output stream, a file or a network target. [LogOutput] may
/// cache multiple log messages.
abstract class LogOutput {
  void output(Level level, List<String> lines);

  void dispose() {}
}
part of logger;

/// Use instances of logger to send log messages to the [LogPrinter].
class Logger {
  /// The current logging level of the app.
  ///
  /// All logs with levels below this level will be omitted.
  static Level level = Level.verbose;

  final LogFilter _filter;
  final LogPrinter _printer;
  final LogOutput _output;

  /// Create a new instance of Logger.
  ///
  /// You can provide a custom [printer] and [filter]. Otherwise the defaults:
  /// [PrettyPrinter] and [DebugFilter] will be used.
  Logger({LogFilter filter, LogPrinter printer, LogOutput output})
      : _printer = printer ?? PrettyPrinter(),
        _filter = filter ?? DebugFilter(),
        _output = output ?? ConsoleOutput();

  /// Log message at level [Level.verbose].
  void v(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.verbose, message, error, stackTrace);
  }

  /// Log message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.debug, message, error, stackTrace);
  }

  /// Log message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.info, message, error, stackTrace);
  }

  /// Log message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.warning, message, error, stackTrace);
  }

  /// Log message at level [Level.error].
  void e(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.error, message, error, stackTrace);
  }

  /// Log message at level [Level.wtf].
  void wtf(dynamic message, [dynamic error, StackTrace stackTrace]) {
    log(Level.wtf, message, error, stackTrace);
  }

  /// Log message with [level].
  Future log(Level level, dynamic message,
      [dynamic error, StackTrace stackTrace]) async {
    assert(error == null || !(error is StackTrace),
        "Error parameter cannot take a StackTrace!");
    if (_filter.shouldLog(level, message, error, stackTrace)) {
      final list = await _printer.log(
        level,
        message,
        error,
        stackTrace,
      ) ?? [];
      _output.output(level, list);
    }
  }

  void dispose() {
    _printer.dispose();
    _output.dispose();
    _filter.dispose();
  }
}

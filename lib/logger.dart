/// Small, easy to use and extensible logger which prints beautiful logs.
library logger;

import 'dart:convert';
import 'src/ansi_color.dart';

part 'src/default/console_output.dart';
part 'src/default/debug_filter.dart';
part 'src/default/pretty_printer.dart';
part 'src/components/level.dart';
part 'src/components/log_output.dart';
part 'src/components/log_printer.dart';
part 'src/components/log_filter.dart';
part 'src/logger.dart';

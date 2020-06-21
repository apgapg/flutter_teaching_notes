import 'package:logger/logger.dart';

import 'i_log.dart';
import 'logger/my_printer.dart';

class MyLogger implements ILog {
  final _logger = Logger(
    printer: MyPrinter(
        methodCount: 0,
        // number of method calls to be displayed
        errorMethodCount: 10,
        // number of method calls if stacktrace is provided
        lineLength: 120,
        // width of the output
        colors: false,
        // Colorful log messages
        // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  @override
  void d(dynamic object) {
    _logger.d(object);
  }

  @override
  void e(dynamic object, StackTrace s) {
    _logger.e(object, null, s);
  }

  @override
  void i(dynamic object) {
    _logger.i(object);
  }

  @override
  void v(dynamic object) {
    _logger.v(object);
  }

  @override
  void w(dynamic object) {
    _logger.w(object);
  }

  @override
  void wtf(dynamic object) {
    _logger.wtf(object);
  }
}

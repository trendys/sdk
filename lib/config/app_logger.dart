import 'package:logging/logging.dart' show Level;
import 'package:trendys_sdk/config/logger.dart';

class AppLogger {
  AppLogger() : _logger = Logger();

  final Logger _logger;

  Future<void> newSession() async => await _logger.newSession();

  void navigation(String message, {Level? level, Object? extra}) {
    _logger.log(message, name: kTagNavigation, level: level, extra: extra);
  }

  void network(String message, {Level? level, Object? extra}) {
    _logger.log(message, name: kTagNetwork, level: level, extra: extra);
  }

  void ui(String message, {Level? level, Object? extra}) {
    _logger.log(message, name: kTagUI, level: level, extra: extra);
  }

  void logManagement(String message, {Level? level, Object? extra}) {
    _logger.log(message, name: Logger.kTagLogManagement, level: level, extra: extra);
  }

  void session(String message, {Level? level, Object? extra}) {
    _logger.log(message, name: kTagSession, level: level, extra: extra);
  }

  void stream(String message, {Level? level, Object? extra}) {
    _logger.log(message, name: kTagStream, level: level, extra: extra);
  }

  static const kTagNavigation = 'NAVIGATION';
  static const kTagNetwork = 'NETWORK';
  static const kTagUI = 'UI';
  static const kTagSession = 'SESSION';
  static const kTagStream = 'STREAM';
}

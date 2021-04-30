import 'dart:convert' show LineSplitter, utf8;
import 'dart:developer' as developer;
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kReleaseMode, kIsWeb;
import 'package:logging/logging.dart' show Level;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';

// This class handle app logs files, store and send
class Logger {
  final Lock _lock;
  Directory? _logDirectory;
  Directory? _logDirectoryPrevious;
  File? _logFile;

  Logger() : _lock = Lock();

  Future<void> newSession() async {
    if (kIsWeb) return;

    _logDirectory ??= await _resolveMainLogDirectory();
    _logDirectoryPrevious ??= _getPreviousLogDirectory();
    _logFile ??= _getLogFile();

    if (_logDirectory == null || _logDirectoryPrevious == null || _logFile == null) {
      _print('Unable to init log file', name: kTagLogManagement, level: Level.WARNING);

      throw ArgumentError('Unable to init log file');
    }

    await _movePreviousFile();

    try {
      final content = await _getBaseFileContent();

      _logFile!.createSync();

      await _logFile!.writeAsString(content, mode: FileMode.writeOnlyAppend, flush: false);
    } on Exception catch (exception) {
      _print('Unable to init log file', name: kTagLogManagement, level: Level.SEVERE, extra: exception);
    }
  }

  void log(String message, {required String name, Level? level, Object? extra}) {
    if (!kReleaseMode) _print(message, level: level, name: name, extra: extra);
    if (_logFile == null) return;

    _lock.synchronized(() async {
      await _logFile!.writeAsString('${DateTime.now()} $name $log\n', mode: FileMode.append, flush: false);
    });
  }

  Future<void> _movePreviousFile() async {
    if (_logDirectory == null || _logDirectoryPrevious == null || _logFile == null) return;

    if (_logFile!.existsSync()) {
      _print('Previous log file exist: move it', name: kTagLogManagement, level: Level.CONFIG);

      try {
        final firstLineOfPreviousFile =
            await _logFile!.openRead(0, 512).transform(utf8.decoder).transform(const LineSplitter()).first;

        final previousLogFileName = int.parse(firstLineOfPreviousFile);
        final previousLogFilePath = path.join(_logDirectoryPrevious!.path, '$previousLogFileName.log');

        _logFile!.renameSync(previousLogFilePath);

        _print('Previous log file exist: moved', name: kTagLogManagement, level: Level.CONFIG);
      } on Exception catch (exception) {
        _print('Unable to move previous file log', name: kTagLogManagement, level: Level.SEVERE, extra: exception);
      }
    }

    _logFile = _getLogFile()!;

    if (_logFile == null) return;

    if (_logFile!.existsSync()) {
      _print('previous file is present, delete it', name: kTagLogManagement, level: Level.CONFIG);

      try {
        _logFile!.deleteSync();
      } on FileSystemEntity catch (exception) {
        _print('unable to delete previous file', name: kTagLogManagement, level: Level.SEVERE, extra: exception);
      }
    }
  }

  Future<String> _getBaseFileContent() async {
    final description = StringBuffer();
    final time = DateTime.now().toUtc();
    final localTime = DateTime.now();
    final tz = DateTime.now().timeZoneName;
    final packageInfo = await PackageInfo.fromPlatform();
    final local = Platform.localeName;
    final deviceName = await _deviceName();

    description
      ..write(time.millisecondsSinceEpoch.toString())
      ..write('\n')
      ..write('Local date: ${localTime.toIso8601String()}')
      ..write('\n')
      ..write('UTC date: ${time.toIso8601String()}')
      ..write('\n')
      ..write('Timezone: $tz')
      ..write('\n')
      ..write('App version: ${packageInfo.version} (${packageInfo.buildNumber})')
      ..write('\n')
      ..write('Platform: ${Platform.operatingSystem} ${Platform.operatingSystemVersion} $local')
      ..write('\n');

    if (deviceName != null) {
      description.write('Device: $deviceName');
    }

    description..write('\n')..write('---------- New App Session ----------')..write('\n');

    return description.toString();
  }

  Future<String?> _deviceName() async {
    final deviceInfo = DeviceInfoPlugin();

    if (kIsWeb) {
      final webBrowserInfo = await deviceInfo.webBrowserInfo;

      return webBrowserInfo.userAgent;
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;

      return '${androidInfo.manufacturer} ${androidInfo.model}';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;

      return iosInfo.model;
    } else if (Platform.isMacOS) {
      final macOsInfo = await deviceInfo.macOsInfo;

      return macOsInfo.model;
    } else {
      return null;
    }
  }

  static Future<Directory?> _resolveMainLogDirectory() async {
    if (kIsWeb) return null;

    // TODO(refact): getApplicationDocumentsDirectory can also be used
    final temporaryDirectory = await getTemporaryDirectory();
    final logDirPath = path.join(temporaryDirectory.path, kLogDirectory);

    try {
      return Directory(logDirPath)..createSync();
    } on FileSystemException {
      return null;
    }
  }

  File? _getLogFile() {
    if (_logDirectory == null) return null;

    final logFilePath = path.join(_logDirectory!.path, kCurrentFileName);

    return File(logFilePath);
  }

  Directory? _getPreviousLogDirectory() {
    if (_logDirectory == null) return null;

    final previousLogDirPath = path.join(_logDirectory!.path, kPreviousLogDirectory);

    try {
      return Directory(previousLogDirPath)..createSync();
    } on FileSystemException {
      return null;
    }
  }

  void _print(String message, {Level? level, required String name, Object? extra}) {
    level ??= Level.INFO;

    developer.log(message, name: name, error: extra, level: level.value);
  }

  static const kCurrentFileName = 'current.log';
  static const kPreviousLogDirectory = 'previous';
  static const kLogDirectory = 'logs';
  static const kTagLogManagement = 'LOG_MANAGEMENT';
}

import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyStore {
  static FlutterSecureStorage _getInstanceMobile() => const FlutterSecureStorage();

  static Future<SharedPreferences> _getInstanceWeb() async => await SharedPreferences.getInstance();

  static Future<String?> getString(String key) async {
    if (kIsWeb) {
      return (await _getInstanceWeb()).getString(key);
    } else if (Platform.isAndroid || Platform.isIOS) {
      return await _getInstanceMobile().read(key: key);
    } else if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return (await _getInstanceWeb()).getString(key); // TODO(refact): replace to use secure store
    } else {
      throw PlatformException(code: 'notSupported'); // TODO(refact): support all platforms
    }
  }

  static Future<void> setString(String key, String? value) async {
    if (kIsWeb) {
      if (value == null) {
        await (await _getInstanceWeb()).remove(key);
      } else {
        await (await _getInstanceWeb()).setString(key, value);
      }

      return;
    } else if (Platform.isAndroid || Platform.isIOS) {
      if (value == null) {
        return await _getInstanceMobile().delete(key: key);
      } else {
        return await _getInstanceMobile().write(key: key, value: value);
      }
    } else if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      // TODO(refact): replace to use secure store
      if (value == null) {
        await (await _getInstanceWeb()).remove(key);
      } else {
        await (await _getInstanceWeb()).setString(key, value);
      }
    } else {
      throw PlatformException(code: 'notSupported'); // TODO(refact): support all platforms
    }
  }
}

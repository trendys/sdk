import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyStore {
  static FlutterSecureStorage get instanceMobile => FlutterSecureStorage();

  static Future<SharedPreferences> get instanceWeb async => await SharedPreferences.getInstance();

  static Future<String> getString(String key) async {
    if (kIsWeb) {
      return (await instanceWeb).getString(key);
    } else if (Platform.isAndroid || Platform.isIOS) {
      return await instanceMobile.read(key: key);
    } else {
      throw PlatformException(code: 'notSupported'); // TODO support all platform
    }
  }

  static Future<void> setString(String key, String value) async {
    if (kIsWeb) {
      await (await instanceWeb).setString(key, value);
    } else if (Platform.isAndroid || Platform.isIOS) {
      await instanceMobile.write(key: key, value: value);
    } else {
      throw PlatformException(code: 'notSupported'); // TODO support all platform
    }

    return;
  }
}

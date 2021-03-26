import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Constants {
  static const String productionUrl = 'https://api.trendys.fr';
  static const String stagingUrl = 'https://api.staging.trendys.fr';
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 3000;

  static final dioOptions = BaseOptions(
    baseUrl: Constants.productionUrl,
    connectTimeout: Constants.connectTimeout,
    receiveTimeout: Constants.receiveTimeout,
  );
}

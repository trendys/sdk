import 'package:dio/dio.dart';

abstract class Constants {
  static const String productionUrl = 'https://api.trendys.fr';
  static const String stagingUrl = 'https://api.staging.trendys.fr';
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 3000;

  static final dioOptions = BaseOptions(
    connectTimeout: Constants.connectTimeout,
    receiveTimeout: Constants.receiveTimeout,
  );
}

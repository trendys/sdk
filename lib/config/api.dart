import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

class Api {
  static final dioOptions = BaseOptions(
    headers: <String, String>{
      'Accept': 'application/json',
    },
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );

  static const kDefaultPageSize = 25;
  static const kPrivateRequestBody = 'private_request_body';
  static const kPrivateResponseBody = 'private_response_body';
  static const kAnnotationPrivateBody = <String, bool>{kPrivateRequestBody: true, kPrivateResponseBody: true};
  static const kAnnotationPrivateRequestBody = <String, bool>{kPrivateRequestBody: true, kPrivateResponseBody: false};
  static const kAnnotationPrivateResponseBody = <String, bool>{kPrivateRequestBody: false, kPrivateResponseBody: true};
}

@immutable
class PrivateBody extends Extra {
  const PrivateBody() : super(Api.kAnnotationPrivateBody);
}

@immutable
class PrivateRequestBody extends Extra {
  const PrivateRequestBody() : super(Api.kAnnotationPrivateBody);
}

@immutable
class PrivateResponseBody extends Extra {
  const PrivateResponseBody() : super(Api.kAnnotationPrivateBody);
}

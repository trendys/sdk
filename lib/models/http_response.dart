import 'package:retrofit/dio.dart';

export 'package:retrofit/dio.dart';

extension HttpResponseExtension on HttpResponse {
  int get maxPages => int.parse(response.headers.value('X-Pages')!);
}

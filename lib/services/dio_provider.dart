import 'package:dio/dio.dart';

Dio dioProvider() {
  final dio = Dio();
  dio.options.headers["Accept"] = "*/*";
  dio.options.validateStatus = (status) {
    return status! < 500;
  };
  return dio;
}

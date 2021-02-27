import 'package:dio/dio.dart';

class ApiClient {
  static BaseOptions options = BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
  );

  static Dio apiClient = Dio(options);
}

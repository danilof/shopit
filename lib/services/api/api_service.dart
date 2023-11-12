import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shop_it/services/api/api.dart';
import 'package:shop_it/services/api/api_interceptor.dart';
import 'package:shop_it/services/environment_service.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService implements Api {
  factory ApiService() {
    Dio dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.followRedirects = false;
    dio.interceptors.add(DioInterceptor(dio));
    return _ApiService(dio, baseUrl: EnvironmentService.baseUrl);
  }
}
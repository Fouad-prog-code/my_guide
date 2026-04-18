import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_endpoints.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/dio/dio_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  @singleton
  @injectable
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 20),
      sendTimeout: Duration(seconds: 20),
    );
  }

  @singleton
  @injectable
  PrettyDioLogger providPprettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
    );
  }

  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  @injectable
  ApiServices provideApiServices(Dio dio) {
    return ApiServices(dio);
  }
}

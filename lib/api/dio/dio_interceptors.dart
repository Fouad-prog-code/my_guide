import 'package:dio/dio.dart';
import 'package:my_guide/core/errors/app_error.dart';

class DioInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppError appError;

    String message = 'something went wrong, please try again';

    if (err.response != null && err.response!.data is Map) {
      final responseData = err.response!.data as Map;

      message =
          (responseData['errors']?['msg'] as String?) ??
          (responseData['message'] as String?) ??
          message;
    }
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.connectionError) {
      appError = NetworkError(
        errorMessage:
            'No Internet Connection, Please check your Internet Connection',
      );
    } else if (err.response != null && err.response!.statusCode != null) {
      appError = ServerError(
        errorMessage: message,
        statusCode: err.response!.statusCode,
      );
    } else {
      appError = UnExpectedError(errorMessage: message);
    }

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        error: appError,
        message: appError.errorMessage,
        response: err.response,
        type: err.type,
      ),
    );
  }
}

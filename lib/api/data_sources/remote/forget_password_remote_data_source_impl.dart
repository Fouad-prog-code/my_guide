import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/forget_password_request_mapper.dart';
import 'package:my_guide/api/mappers/forget_password_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/forget_password_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/forget_password/forget_password_request.dart';
import 'package:my_guide/domain/entities/response/forget_password/forget_password_response.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  ApiServices apiServices;

  ForgetPasswordRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ForgetPasswordResponse> resetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    try {
      var response = await apiServices.resetPassword(
        forgetPasswordRequest.toForgetPasswordRequestDto(),
      );

      return response.toForgetPasswordResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;

      throw ServerError(errorMessage: message);
    }
  }
}

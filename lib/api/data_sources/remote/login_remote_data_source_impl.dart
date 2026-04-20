import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/login_request_mapper.dart';
import 'package:my_guide/api/mappers/login_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/login_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/login/login_request.dart';
import 'package:my_guide/domain/entities/response/login/login_response.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  ApiServices apiServices;

  LoginRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      var response = await apiServices.login(loginRequest.toLoginRequestDto());
      return response.toLoginResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

import 'package:my_guide/api/mappers/login_data_mapper.dart';
import 'package:my_guide/api/models/response/login/login_response_dto.dart';
import 'package:my_guide/domain/entities/response/login/login_response.dart';

extension LoginResponseMapper on LoginResponseDto {
  LoginResponse toLoginResponse() {
    return LoginResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      errors: errors,
      meta: message,
      data: data!.toData(),
    );
  }
}

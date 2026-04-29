import 'package:my_guide/api/models/response/forget_password/forget_password_response_dto.dart';
import 'package:my_guide/domain/entities/response/forget_password/forget_password_response.dart';

extension ForgetPasswordResponseMapper on ForgetPasswordResponseDto {
  ForgetPasswordResponse toForgetPasswordResponse() {
    return ForgetPasswordResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      data: data,
      errors: errors,
      meta: meta,
    );
  }
}

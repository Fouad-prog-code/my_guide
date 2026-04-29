import 'package:my_guide/api/models/request/forget_password/forget_password_request_dto.dart';
import 'package:my_guide/domain/entities/request/forget_password/forget_password_request.dart';

extension ForgetPasswordRequestMapper on ForgetPasswordRequest {
  ForgetPasswordRequestDto toForgetPasswordRequestDto() {
    return ForgetPasswordRequestDto(
      userName: userName,
      nationalId: nationalId,
      newPassword: newPassword,
    );
  }
}

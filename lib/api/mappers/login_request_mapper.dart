import 'package:my_guide/api/models/request/login/login_request_dto.dart';
import 'package:my_guide/domain/entities/request/login/login_request.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(userName: userName, password: password);
  }
}

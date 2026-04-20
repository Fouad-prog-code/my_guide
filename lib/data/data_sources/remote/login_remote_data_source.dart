import 'package:my_guide/domain/entities/request/login/login_request.dart';
import 'package:my_guide/domain/entities/response/login/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
}

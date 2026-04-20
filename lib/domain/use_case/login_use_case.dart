import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/request/login/login_request.dart';
import 'package:my_guide/domain/entities/response/login/login_response.dart';
import 'package:my_guide/domain/repositories/login_repository.dart';

@injectable
class LoginUseCase {
  LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<LoginResponse> invoke(LoginRequest loginRequest) {
    return loginRepository.login(loginRequest);
  }
}

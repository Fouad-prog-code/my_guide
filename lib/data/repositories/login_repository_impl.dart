import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/login_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/login/login_request.dart';
import 'package:my_guide/domain/entities/response/login/login_response.dart';
import 'package:my_guide/domain/repositories/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return loginRemoteDataSource.login(loginRequest);
  }
}

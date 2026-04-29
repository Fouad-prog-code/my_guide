import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/forget_password_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/forget_password/forget_password_request.dart';
import 'package:my_guide/domain/entities/response/forget_password/forget_password_response.dart';
import 'package:my_guide/domain/repositories/forget_password_repository.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource;

  ForgetPasswordRepositoryImpl({required this.forgetPasswordRemoteDataSource});

  @override
  Future<ForgetPasswordResponse> resetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  ) {
    return forgetPasswordRemoteDataSource.resetPassword(forgetPasswordRequest);
  }
}

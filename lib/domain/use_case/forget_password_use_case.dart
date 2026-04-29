import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/request/forget_password/forget_password_request.dart';
import 'package:my_guide/domain/entities/response/forget_password/forget_password_response.dart';
import 'package:my_guide/domain/repositories/forget_password_repository.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepository forgetPasswordRepository;
  ForgetPasswordUseCase({required this.forgetPasswordRepository});

  Future<ForgetPasswordResponse> invoke(
    ForgetPasswordRequest forgetPasswordRequest,
  ) {
    return forgetPasswordRepository.resetPassword(forgetPasswordRequest);
  }
}

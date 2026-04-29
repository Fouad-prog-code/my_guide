import 'package:my_guide/domain/entities/request/forget_password/forget_password_request.dart';
import 'package:my_guide/domain/entities/response/forget_password/forget_password_response.dart';

abstract class ForgetPasswordRepository {
  Future<ForgetPasswordResponse> resetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  );
}

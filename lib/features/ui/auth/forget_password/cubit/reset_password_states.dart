import 'package:my_guide/domain/entities/response/forget_password/forget_password_response.dart';

abstract class ResetPasswordStates {}

class ResetPasswordInitState extends ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordErrorState extends ResetPasswordStates {
  String message;

  ResetPasswordErrorState({required this.message});
}

class ResetPasswordSuccessState extends ResetPasswordStates {
  ForgetPasswordResponse forgetPasswordResponse;

  ResetPasswordSuccessState({required this.forgetPasswordResponse});
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/forget_password/forget_password_request.dart';
import 'package:my_guide/domain/use_case/forget_password_use_case.dart';
import 'package:my_guide/features/ui/auth/forget_password/cubit/reset_password_states.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  ForgetPasswordUseCase forgetPasswordUseCase;

  ResetPasswordViewModel({required this.forgetPasswordUseCase})
    : super(ResetPasswordInitState());

  final TextEditingController userController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  resetPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(ResetPasswordLoadingState());

        ForgetPasswordRequest forgetPasswordRequest = ForgetPasswordRequest(
          userName: userController.text,
          nationalId: idController.text,
          newPassword: newPasswordController.text,
        );

        var response = await forgetPasswordUseCase.invoke(
          forgetPasswordRequest,
        );

        emit(ResetPasswordSuccessState(forgetPasswordResponse: response));
      } on AppError catch (e) {
        emit(ResetPasswordErrorState(message: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          ResetPasswordErrorState(
            message: message ?? 'UnExpected error occurred',
          ),
        );
      }
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/domain/entities/request/login/login_request.dart';
import 'package:my_guide/domain/use_case/login_use_case.dart';
import 'package:my_guide/features/ui/auth/login/cubit/login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  login() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(LoginLoadingState());

        LoginRequest loginRequest = LoginRequest(
          userName: userController.text,
          password: passwordController.text,
        );

        var response = await loginUseCase.invoke(loginRequest);

        emit(LoginSuccessState(response: response));
      } on AppError catch (e) {
        emit(LoginErrorState(errorMessage: e.errorMessage));
      } on DioException catch (e) {
        final message = (e.error is AppError)
            ? (e.error as AppError).errorMessage
            : e.message;
        emit(
          LoginErrorState(errorMessage: message ?? 'UnExpected error occurred'),
        );
      }
    }
  }
}

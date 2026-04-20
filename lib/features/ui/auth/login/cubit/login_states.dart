import 'package:my_guide/domain/entities/response/login/login_response.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginResponse response;

  LoginSuccessState({required this.response});
}

class LoginErrorState extends LoginStates {
  String errorMessage;

  LoginErrorState({required this.errorMessage});
}

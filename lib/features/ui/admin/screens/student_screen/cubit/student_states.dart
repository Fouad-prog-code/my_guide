import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';

abstract class StudentStates {}

class StudentInitState extends StudentStates {}

class StudentLoadingState extends StudentStates {}

class StudentErrorState extends StudentStates {
  String message;

  StudentErrorState({required this.message});
}

class StudentSuccessState extends StudentStates {
  AddUserResponse addUserResponse;

  StudentSuccessState({required this.addUserResponse});
}

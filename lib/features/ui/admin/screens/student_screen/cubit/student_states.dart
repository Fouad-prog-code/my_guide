import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';

abstract class StudentStates {}

class StudentInitState extends StudentStates {}

class AddStudentLoadingState extends StudentStates {}

class AddStudentErrorState extends StudentStates {
  String message;

  AddStudentErrorState({required this.message});
}

class AddStudentSuccessState extends StudentStates {
  AddUserResponse addUserResponse;

  AddStudentSuccessState({required this.addUserResponse});
}

class GetStudentLoadingState extends StudentStates {}

class GetStudentErrorState extends StudentStates {
  String message;

  GetStudentErrorState({required this.message});
}

class GetStudentSuccessState extends StudentStates {}

class DeleteStudentLoadingState extends StudentStates {}

class DeleteStudentErrorState extends StudentStates {
  String message;

  DeleteStudentErrorState({required this.message});
}

class DeleteStudentSuccessState extends StudentStates {
  UpdateOrDeleteUserResponse studentResponse;

  DeleteStudentSuccessState({required this.studentResponse});
}

class UpdateStudentLoadingState extends StudentStates {}

class UpdateStudentErrorState extends StudentStates {
  String message;

  UpdateStudentErrorState({required this.message});
}

class UpdateStudentSuccessState extends StudentStates {
  UpdateOrDeleteUserResponse studentResponse;

  UpdateStudentSuccessState({required this.studentResponse});
}

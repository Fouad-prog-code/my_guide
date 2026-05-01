import 'package:my_guide/domain/entities/response/add_subject/add_subject_response.dart';
import 'package:my_guide/domain/entities/response/delete_subject/delete_subject_response.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';

abstract class SubjectStates {}

class SubjectInitState extends SubjectStates {}

class AddSubjectLoadingState extends SubjectStates {}

class GetSubjectLoadingState extends SubjectStates {}

class AddSubjectErrorState extends SubjectStates {
  String addSubjectmessage;

  AddSubjectErrorState({required this.addSubjectmessage});
}

class GetSubjectErrorState extends SubjectStates {
  String getSubjectmessage;

  GetSubjectErrorState({required this.getSubjectmessage});
}

class AddSubjectSuccessState extends SubjectStates {
  AddSubjectResponse addSubjectResponse;

  AddSubjectSuccessState({required this.addSubjectResponse});
}

class GetSubjectSuccessState extends SubjectStates {}

class DeleteSubjectLoadingState extends SubjectStates {}

class DeleteSubjectErrorState extends SubjectStates {
  String message;

  DeleteSubjectErrorState({required this.message});
}

class DeleteSubjectSuccessState extends SubjectStates {
  DeleteSubjectResponse deleteSubjectResponse;

  DeleteSubjectSuccessState({required this.deleteSubjectResponse});
}

class UpdateCourseLoadingState extends SubjectStates {}

class UpdateCourseErrorState extends SubjectStates {
  String message;

  UpdateCourseErrorState({required this.message});
}

class UpdateCourseSuccessState extends SubjectStates {
  UpdateOrDeleteUserResponse response;

  UpdateCourseSuccessState({required this.response});
}

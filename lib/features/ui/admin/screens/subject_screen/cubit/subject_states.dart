import 'package:my_guide/domain/entities/response/add_subject/add_subject_response.dart';
import 'package:my_guide/domain/entities/response/get_subject/get_subject_response.dart';

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

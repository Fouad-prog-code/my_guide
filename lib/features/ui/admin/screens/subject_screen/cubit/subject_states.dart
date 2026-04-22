import 'package:my_guide/domain/entities/response/add_subject/add_subject_response.dart';

abstract class SubjectStates {}

class SubjectInitState extends SubjectStates {}

class SubjectLoadingState extends SubjectStates {}

class SubjectErrorState extends SubjectStates {
  String message;

  SubjectErrorState({required this.message});
}

class SubjectSuccessState extends SubjectStates {
  AddSubjectResponse addSubjectResponse;

  SubjectSuccessState({required this.addSubjectResponse});
}

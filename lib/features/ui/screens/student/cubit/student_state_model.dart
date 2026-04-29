import 'package:my_guide/domain/entities/response/student_schedule_response.dart';

sealed class StudentStates {}

class StudentLoadingState extends StudentStates {}

class StudentErrorState extends StudentStates {
  String errorMessage;
  StudentErrorState({required this.errorMessage});
}

class StudentSuccessState extends StudentStates {
  StudentScheduleResponse studentScheduleResponse;
  StudentSuccessState({required this.studentScheduleResponse});
}

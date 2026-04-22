import 'package:my_guide/domain/entities/response/doctor/doctor_response.dart';

abstract class DoctorScheduleStates {}

class DoctorinitState extends DoctorScheduleStates {}

class DoctorLoadingState extends DoctorScheduleStates {}

class DoctorErrorState extends DoctorScheduleStates {
  String message;
  DoctorErrorState({required this.message});
}

class DoctorSuccessState extends DoctorScheduleStates {
  DoctorResponse response;
  DoctorSuccessState({required this.response});
}

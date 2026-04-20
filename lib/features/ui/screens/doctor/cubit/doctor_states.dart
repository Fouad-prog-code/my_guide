import 'package:my_guide/domain/entities/response/doctor/doctor_response.dart';

abstract class DoctorStates {}

class DoctorinitState extends DoctorStates {}

class DoctorLoadingState extends DoctorStates {}

class DoctorErrorState extends DoctorStates {
  String message;
  DoctorErrorState({required this.message});
}

class DoctorSuccessState extends DoctorStates {
  DoctorResponse response;
  DoctorSuccessState({required this.response});
}

import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';

abstract class DoctorStates {}

class DoctorInitState extends DoctorStates {}

class DoctorLoadingState extends DoctorStates {}

class DoctorErrorState extends DoctorStates {
  String message;

  DoctorErrorState({required this.message});
}

class DoctorSuccessState extends DoctorStates {
  AddUserResponse addDoctorResponse;

  DoctorSuccessState({required this.addDoctorResponse});
}

import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';

abstract class ManagerStates {}

class ManagerInitState extends ManagerStates {}

class AddManagerLoadingState extends ManagerStates {}

//class GetDoctorLoadingState extends ManagerStates {}

class AddManagerErrorState extends ManagerStates {
  String message;

  AddManagerErrorState({required this.message});
}

// class GetDoctorErrorState extends ManagerStates {
//   String message;

//   GetDoctorErrorState({required this.message});
// }

class AddManagerSuccessState extends ManagerStates {
  AddUserResponse addManagerResponse;

  AddManagerSuccessState({required this.addManagerResponse});
}

// class GetDoctorSuccessState extends ManagerStates {}

// class UpdateDoctorLoadingState extends ManagerStates {}

// class UpdateDoctorErrorState extends ManagerStates {
//   String message;

//   UpdateDoctorErrorState({required this.message});
// }

// class UpdateDoctorSuccessState extends ManagerStates {
//   UpdateOrDeleteUserResponse updateDoctorResponse;

//   UpdateDoctorSuccessState({required this.updateDoctorResponse});
// }

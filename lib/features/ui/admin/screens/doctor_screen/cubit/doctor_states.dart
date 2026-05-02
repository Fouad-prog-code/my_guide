import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/response/delete_doctor/delete_doctor_response.dart';

abstract class DoctorStates {}

class DoctorInitState extends DoctorStates {}

class AddDoctorLoadingState extends DoctorStates {}

class GetDoctorLoadingState extends DoctorStates {}

class AddDoctorErrorState extends DoctorStates {
  String message;

  AddDoctorErrorState({required this.message});
}

class GetDoctorErrorState extends DoctorStates {
  String message;

  GetDoctorErrorState({required this.message});
}

class AddDoctorSuccessState extends DoctorStates {
  AddUserResponse addDoctorResponse;

  AddDoctorSuccessState({required this.addDoctorResponse});
}

class GetDoctorSuccessState extends DoctorStates {}

class UpdateDoctorLoadingState extends DoctorStates {}

class UpdateDoctorErrorState extends DoctorStates {
  String message;

  UpdateDoctorErrorState({required this.message});
}

class UpdateDoctorSuccessState extends DoctorStates {
  UpdateOrDeleteObjectResponse updateDoctorResponse;

  UpdateDoctorSuccessState({required this.updateDoctorResponse});
}

class DeleteDoctorLoadingState extends DoctorStates {}

class DeleteDoctorErrorState extends DoctorStates {
  String message;

  DeleteDoctorErrorState({required this.message});
}

class DeleteDoctorSuccessState extends DoctorStates {
  DeleteDoctorResponse deleteDoctorResponse;

  DeleteDoctorSuccessState({required this.deleteDoctorResponse});
}

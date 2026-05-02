import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/response/add_department/add_department_response.dart';

abstract class DepartmentStates {}

class DepartmentInitialState extends DepartmentStates {}

class AddDepartmentLoadingState extends DepartmentStates {}

class AddDepartmentErrorState extends DepartmentStates {
  String errorMessage;

  AddDepartmentErrorState({required this.errorMessage});
}

class AddDepartmentSuccessState extends DepartmentStates {
  AddDepartmentResponse addDepartmentResponse;

  AddDepartmentSuccessState({required this.addDepartmentResponse});
}

class GetDepartmentLoadingState extends DepartmentStates {}

class GetDepartmentErrorState extends DepartmentStates {
  String errorMessage;

  GetDepartmentErrorState({required this.errorMessage});
}

class GetDepartmentSuccessState extends DepartmentStates {}

class UpdateDepartmentLoadingState extends DepartmentStates {}

class UpdateDepartmentErrorState extends DepartmentStates {
  String errorMessage;

  UpdateDepartmentErrorState({required this.errorMessage});
}

class UpdateDepartmentSuccessState extends DepartmentStates {
  UpdateOrDeleteObjectResponse updateDepartmentResponse;

  UpdateDepartmentSuccessState({required this.updateDepartmentResponse});
}

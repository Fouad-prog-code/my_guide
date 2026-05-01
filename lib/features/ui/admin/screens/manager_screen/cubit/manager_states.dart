import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';

abstract class ManagerStates {}

class ManagerInitState extends ManagerStates {}

class AddManagerLoadingState extends ManagerStates {}

class AddManagerErrorState extends ManagerStates {
  String message;

  AddManagerErrorState({required this.message});
}

class GetManagerLoadingState extends ManagerStates {}

class GetManagerSuccessState extends ManagerStates {}

class GetManagerErrorState extends ManagerStates {
  final String message;

  GetManagerErrorState({required this.message});
}

class UpdateManagerLoadingState extends ManagerStates {}

class UpdateManagerSuccessState extends ManagerStates {
  UpdateOrDeleteUserResponse updateManagerResponse;

  UpdateManagerSuccessState({required this.updateManagerResponse});
}

class UpdateManagerErrorState extends ManagerStates {
  final String message;

  UpdateManagerErrorState({required this.message});
}

class AddManagerSuccessState extends ManagerStates {
  AddUserResponse addManagerResponse;

  AddManagerSuccessState({required this.addManagerResponse});
}

class DeleteManagerLoadingState extends ManagerStates {}

class DeleteManagerSuccessState extends ManagerStates {
  UpdateOrDeleteUserResponse deleteManagerResponse;

  DeleteManagerSuccessState({required this.deleteManagerResponse});
}

class DeleteManagerErrorState extends ManagerStates {
  final String message;

  DeleteManagerErrorState({required this.message});
}

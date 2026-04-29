import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/request/add_doctor_or_manager/add_doctor_or_manager_request.dart';

abstract class AddManagerRepository {
  Future<AddUserResponse> addManager(
    AddDoctOrManagerRequest addManager,
    String token,
  );
}

import 'package:my_guide/domain/entities/request/add_doctor_or_manager/add_doctor_or_manager_request.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';

abstract class AddDoctorRepository {
  Future<AddUserResponse> addDoctor(
    AddDoctOrManagerRequest addDoctorRequest,
    String token,
  );
}

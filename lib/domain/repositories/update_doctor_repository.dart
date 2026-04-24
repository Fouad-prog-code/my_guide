import 'package:my_guide/domain/entities/request/update_doctor/update_doctor_request.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';

abstract class UpdateDoctorRepository {
  Future<UpdateOrDeleteUserResponse> updateDoctor(
    UpdateDoctorRequest updateDoctorRequest,
    String token,
  );
}

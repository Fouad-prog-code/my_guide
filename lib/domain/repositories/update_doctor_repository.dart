import 'package:my_guide/domain/entities/request/update_doctor/update_doctor_request.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';

abstract class UpdateDoctorRepository {
  Future<UpdateOrDeleteObjectResponse> updateDoctor(
    UpdateDoctorRequest updateDoctorRequest,
    String token,
  );
}

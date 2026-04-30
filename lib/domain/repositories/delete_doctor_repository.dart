import 'package:my_guide/domain/entities/response/delete_doctor/delete_doctor_response.dart';

abstract class DeleteDoctorRepository {
  Future<DeleteDoctorResponse> deleteDoctor(int id, String token);
}

import 'package:my_guide/domain/entities/response/delete_doctor/delete_doctor_response.dart';

abstract class DeleteDoctorRemoteDataSource {
  Future<DeleteDoctorResponse> deleteDoctor(int id, String token);
}

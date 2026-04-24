import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_response.dart';

abstract class GetDoctorRepository {
  Future<GetDoctorResponse> getDoctor(String token);
}

import 'package:my_guide/domain/entities/response/doctor/doctor_response.dart';

abstract class DoctorRepository {
  Future<DoctorResponse> getDoctorSchedule(int doctorId, String token);
}

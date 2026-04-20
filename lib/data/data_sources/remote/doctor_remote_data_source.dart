import 'package:my_guide/domain/entities/response/doctor/doctor_response.dart';

abstract class DoctorRemoteDataSource {
  Future<DoctorResponse> getDoctorSchedule(int doctorId, String token);
}

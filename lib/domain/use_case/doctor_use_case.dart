import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/doctor/doctor_response.dart';
import 'package:my_guide/domain/repositories/doctor_repository.dart';

@injectable
class DoctorUseCase {
  DoctorRepository doctorRepository;

  DoctorUseCase({required this.doctorRepository});

  Future<DoctorResponse> invoke(int doctorId, String token) {
    return doctorRepository.getDoctorSchedule(doctorId, token);
  }
}

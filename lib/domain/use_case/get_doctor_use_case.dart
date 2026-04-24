import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_response.dart';
import 'package:my_guide/domain/repositories/get_doctor_repository.dart';

@injectable
class GetDoctorUseCase {
  GetDoctorRepository getDoctorRepository;

  GetDoctorUseCase({required this.getDoctorRepository});

  Future<GetDoctorResponse> invoke(String token) {
    return getDoctorRepository.getDoctor(token);
  }
}

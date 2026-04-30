import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/delete_doctor/delete_doctor_response.dart';
import 'package:my_guide/domain/repositories/delete_doctor_repository.dart';

@injectable
class DeleteDoctorUseCase {
  DeleteDoctorRepository deleteDoctorRepository;

  DeleteDoctorUseCase({required this.deleteDoctorRepository});

  Future<DeleteDoctorResponse> invoke(int id, String token) {
    return deleteDoctorRepository.deleteDoctor(id, token);
  }
}

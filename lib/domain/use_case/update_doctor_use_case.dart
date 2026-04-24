import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/request/update_doctor/update_doctor_request.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';
import 'package:my_guide/domain/repositories/update_doctor_repository.dart';

@injectable
class UpdateDoctorUseCase {
  UpdateDoctorRepository updateDoctorRepository;

  UpdateDoctorUseCase({required this.updateDoctorRepository});

  Future<UpdateOrDeleteUserResponse> invoke(
    UpdateDoctorRequest updateDoctorRequest,
    String token,
  ) {
    return updateDoctorRepository.updateDoctor(updateDoctorRequest, token);
  }
}

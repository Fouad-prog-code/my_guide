import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/request/add_doctor/add_doctor_request.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/repositories/add_doctor_repository.dart';

@injectable
class AddDoctorUseCase {
  AddDoctorRepository addDoctorRepository;

  AddDoctorUseCase({required this.addDoctorRepository});

  Future<AddUserResponse> invoke(
    AddDoctorRequest addDoctorRequest,
    String token,
  ) {
    return addDoctorRepository.addDoctor(addDoctorRequest, token);
  }
}

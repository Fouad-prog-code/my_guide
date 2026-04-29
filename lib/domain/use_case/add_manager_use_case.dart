import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/request/add_doctor_or_manager/add_doctor_or_manager_request.dart';
import 'package:my_guide/domain/repositories/add_manager_repository.dart';

@injectable
class AddManagerUseCase {
  AddManagerRepository addManagerRepository;

  AddManagerUseCase({required this.addManagerRepository});

  Future<AddUserResponse> invoke(
    AddDoctOrManagerRequest addManager,
    String token,
  ) {
    return addManagerRepository.addManager(addManager, token);
  }
}

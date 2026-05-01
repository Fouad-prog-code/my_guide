import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';
import 'package:my_guide/domain/repositories/delete_manager_repository.dart';

@injectable
class DeleteManagerUseCase {
  DeleteManagerRepository repository;
  DeleteManagerUseCase({required this.repository});

  Future<UpdateOrDeleteUserResponse> invoke(int managerId, String token) {
    return repository.deleteManager(managerId, token);
  }
}

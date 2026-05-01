import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';
import 'package:my_guide/domain/entities/request/update_manager/update_manager_request.dart';

import 'package:my_guide/domain/repositories/update_manager_repository.dart';

@injectable
class UpdateManagerUseCase {
  UpdateManagerRepository repository;

  UpdateManagerUseCase({required this.repository});

  Future<UpdateOrDeleteUserResponse> invoke(
    UpdateManagerRequest updateManagerRequest,
    String token,
  ) {
    return repository.updateManager(updateManagerRequest, token);
  }
}

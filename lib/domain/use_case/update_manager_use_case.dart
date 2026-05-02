import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_manager/update_manager_request.dart';

import 'package:my_guide/domain/repositories/update_manager_repository.dart';

@injectable
class UpdateManagerUseCase {
  UpdateManagerRepository repository;

  UpdateManagerUseCase({required this.repository});

  Future<UpdateOrDeleteObjectResponse> invoke(
    UpdateManagerRequest updateManagerRequest,
    String token,
  ) {
    return repository.updateManager(updateManagerRequest, token);
  }
}

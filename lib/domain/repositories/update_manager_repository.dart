import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_manager/update_manager_request.dart';

abstract class UpdateManagerRepository {
  Future<UpdateOrDeleteObjectResponse> updateManager(
    UpdateManagerRequest updateManagerRequest,
    String token,
  );
}

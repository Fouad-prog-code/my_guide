import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';
import 'package:my_guide/domain/entities/request/update_manager/update_manager_request.dart';

abstract class UpdateManagerRemoteDataSource {
  Future<UpdateOrDeleteUserResponse> updateManager(
    UpdateManagerRequest updateManagerRequest,
    String token,
  );
}

import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_department/update_department_request.dart';

abstract class UpdateDepartmentRemoteDataSource {
  Future<UpdateOrDeleteObjectResponse> updateDepartment(
    UpdateDepartmentRequest updateDepartmentRequest,
    String token,
  );
}

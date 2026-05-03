import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';

abstract class DeleteDeptRemoteDataSource {
  Future<UpdateOrDeleteObjectResponse> deleteDepartment(
    String token,
    int deptId,
  );
}

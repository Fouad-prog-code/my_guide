import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/delete_dept_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/repositories/delete_department_repository.dart';

@Injectable(as: DeleteDepartmentRepository)
class DeleteDeptRepositoryImpl implements DeleteDepartmentRepository {
  DeleteDeptRemoteDataSource deleteDeptRemoteDataSource;

  DeleteDeptRepositoryImpl({required this.deleteDeptRemoteDataSource});
  @override
  Future<UpdateOrDeleteObjectResponse> deleteDepartment(
    String token,
    int deptId,
  ) {
    return deleteDeptRemoteDataSource.deleteDepartment(token, deptId);
  }
}

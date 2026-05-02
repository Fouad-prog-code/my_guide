import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/update_department_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_department/update_department_request.dart';
import 'package:my_guide/domain/repositories/update_department_repository.dart';

@Injectable(as: UpdateDepartmentRepository)
class UpdateDepartmentRepositoryImpl implements UpdateDepartmentRepository {
  UpdateDepartmentRemoteDataSource updateDepartmentRemoteDataSource;

  UpdateDepartmentRepositoryImpl({
    required this.updateDepartmentRemoteDataSource,
  });
  @override
  Future<UpdateOrDeleteObjectResponse> updateDepartment(
    UpdateDepartmentRequest updateDepartmentRequest,
    String token,
  ) {
    return updateDepartmentRemoteDataSource.updateDepartment(
      updateDepartmentRequest,
      token,
    );
  }
}

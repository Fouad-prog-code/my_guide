import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/department_table_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/department_table/department_table_response.dart';
import 'package:my_guide/domain/repositories/department_table_repository.dart';

@Injectable(as: DepartmentTableRepository)
class DepartmentTableRepositoryImpl implements DepartmentTableRepository {
  DepartmentTableRemoteDataSource departmentTableRemoteDataSource;

  DepartmentTableRepositoryImpl({
    required this.departmentTableRemoteDataSource,
  });

  @override
  Future<DepartmentTableResponse> getDepartmentTable(String token) {
    return departmentTableRemoteDataSource.getDepartmentTable(token);
  }
}

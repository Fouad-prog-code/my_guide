import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/get_department_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_department/get_department_response_dto.dart';
import 'package:my_guide/domain/repositories/get_department_repository.dart';

@Injectable(as: GetDepartmentRepository)
class GetDepartmentRepositoryImpl implements GetDepartmentRepository {
  GetDepartmentRemoteDataSource getDepartmentRemoteDataSource;

  GetDepartmentRepositoryImpl({required this.getDepartmentRemoteDataSource});

  @override
  Future<GetDepartmentResponse> getDepartment(String token) {
    return getDepartmentRemoteDataSource.getDepartment(token);
  }
}

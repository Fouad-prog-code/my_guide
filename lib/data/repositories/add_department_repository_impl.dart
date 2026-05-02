import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/add_department_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/add_department/add_department_request.dart';
import 'package:my_guide/domain/entities/response/add_department/add_department_response.dart';
import 'package:my_guide/domain/repositories/add_department_repository.dart';

@Injectable(as: AddDepartmentRepository)
class AddDepartmentRepositoryImpl implements AddDepartmentRepository {
  AddDepartmentRemoteDataSource addDepartmentRemoteDataSource;

  AddDepartmentRepositoryImpl({required this.addDepartmentRemoteDataSource});

  @override
  Future<AddDepartmentResponse> addDepartment(
    AddDepartmentRequest addDepartmentRequest,
    String token,
  ) {
    return addDepartmentRemoteDataSource.addDepartment(
      addDepartmentRequest,
      token,
    );
  }
}

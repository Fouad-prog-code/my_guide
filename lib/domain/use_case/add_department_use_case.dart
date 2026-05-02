import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/request/add_department/add_department_request.dart';
import 'package:my_guide/domain/entities/response/add_department/add_department_response.dart';
import 'package:my_guide/domain/repositories/add_department_repository.dart';

@injectable
class AddDepartmentUseCase {
  AddDepartmentRepository addDepartmentRepository;

  AddDepartmentUseCase({required this.addDepartmentRepository});

  Future<AddDepartmentResponse> invoke(
    AddDepartmentRequest addDepartmentRequest,
    String token,
  ) {
    return addDepartmentRepository.addDepartment(addDepartmentRequest, token);
  }
}

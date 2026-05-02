import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_department/update_department_request.dart';
import 'package:my_guide/domain/repositories/update_department_repository.dart';

@injectable
class UpdateDepartmentUseCase {
  UpdateDepartmentRepository updateDepartmentRepository;

  UpdateDepartmentUseCase({required this.updateDepartmentRepository});

  Future<UpdateOrDeleteObjectResponse> invoke(
    UpdateDepartmentRequest updateDepartmentRequest,
    String token,
  ) {
    return updateDepartmentRepository.updateDepartment(
      updateDepartmentRequest,
      token,
    );
  }
}

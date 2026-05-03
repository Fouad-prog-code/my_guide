import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/repositories/delete_department_repository.dart';

@injectable
class DeleteDeptUseCase {
  DeleteDepartmentRepository deleteDepartmentRepository;

  DeleteDeptUseCase({required this.deleteDepartmentRepository});

  Future<UpdateOrDeleteObjectResponse> invoke(String token, int deptId) {
    return deleteDepartmentRepository.deleteDepartment(token, deptId);
  }
}

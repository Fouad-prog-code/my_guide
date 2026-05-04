import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/department_table/department_table_response.dart';
import 'package:my_guide/domain/repositories/department_table_repository.dart';

@injectable
class DepartmentTableUseCase {
  DepartmentTableRepository departmentTableRepository;

  DepartmentTableUseCase({required this.departmentTableRepository});

  Future<DepartmentTableResponse> invoke(String token) {
    return departmentTableRepository.getDepartmentTable(token);
  }
}

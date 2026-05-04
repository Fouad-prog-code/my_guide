import 'package:my_guide/domain/entities/response/department_table/department_table_response.dart';

abstract class DepartmentTableRepository {
  Future<DepartmentTableResponse> getDepartmentTable(String token);
}

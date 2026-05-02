import 'package:my_guide/domain/entities/request/add_department/add_department_request.dart';
import 'package:my_guide/domain/entities/response/add_department/add_department_response.dart';

abstract class AddDepartmentRepository {
  Future<AddDepartmentResponse> addDepartment(
    AddDepartmentRequest addDepartmentRequest,
    String token,
  );
}

import 'package:my_guide/domain/entities/response/get_department/get_department_response_dto.dart';

abstract class GetDepartmentRepository {
  Future<GetDepartmentResponse> getDepartment(String token);
}

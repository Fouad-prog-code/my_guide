import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/get_department/get_department_response_dto.dart';
import 'package:my_guide/domain/repositories/get_department_repository.dart';

@injectable
class GetDepartmentUseCase {
  GetDepartmentRepository getDepartmentRepository;

  GetDepartmentUseCase({required this.getDepartmentRepository});

  Future<GetDepartmentResponse> invoke(String token) {
    return getDepartmentRepository.getDepartment(token);
  }
}

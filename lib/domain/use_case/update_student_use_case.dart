import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_student/update_student_request.dart';
import 'package:my_guide/domain/repositories/update_student_repository.dart';

@injectable
class UpdateStudentUseCase {
  UpdateStudentRepository updateStudentRepository;

  UpdateStudentUseCase({required this.updateStudentRepository});

  Future<UpdateOrDeleteObjectResponse> invoke(
    UpdateStudentRequest updateStudentRequest,
    String token,
  ) {
    return updateStudentRepository.updateStudent(updateStudentRequest, token);
  }
}

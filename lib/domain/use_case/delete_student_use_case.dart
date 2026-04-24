import 'package:injectable/injectable.dart';

import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';
import 'package:my_guide/domain/repositories/delete_student_repository.dart';

@injectable
class DeleteStudentUseCase {
  DeleteStudentRepository deleteStudentRepository;

  DeleteStudentUseCase({required this.deleteStudentRepository});

  Future<UpdateOrDeleteUserResponse> invoke(int id, String token) {
    return deleteStudentRepository.deleteStudent(id, token);
  }
}

import 'package:injectable/injectable.dart';

import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/repositories/delete_student_repository.dart';

@injectable
class DeleteStudentUseCase {
  DeleteStudentRepository deleteStudentRepository;

  DeleteStudentUseCase({required this.deleteStudentRepository});

  Future<UpdateOrDeleteObjectResponse> invoke(int id, String token) {
    return deleteStudentRepository.deleteStudent(id, token);
  }
}

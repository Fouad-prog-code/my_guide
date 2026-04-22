import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/request/add_student/add_student_request.dart';
import 'package:my_guide/domain/repositories/add_student_repository.dart';

@injectable
class AddStudentUseCase {
  AddStudentRepository addStudentRepository;

  AddStudentUseCase({required this.addStudentRepository});

  Future<AddUserResponse> invoke(
    AddStudentRequest addStudentRequest,
    String token,
  ) {
    return addStudentRepository.addStudent(addStudentRequest, token);
  }
}

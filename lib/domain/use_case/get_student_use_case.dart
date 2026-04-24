import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/get_student/get_student_response.dart';
import 'package:my_guide/domain/repositories/get_student_repository.dart';

@injectable
class GetStudentUseCase {
  GetStudentRepository getStudentRepository;

  GetStudentUseCase({required this.getStudentRepository});

  Future<GetStudentResponse> invoke(String token) {
    return getStudentRepository.getStudent(token);
  }
}

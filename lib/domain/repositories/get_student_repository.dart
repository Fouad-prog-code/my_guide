import 'package:my_guide/domain/entities/response/get_student/get_student_response.dart';

abstract class GetStudentRepository {
  Future<GetStudentResponse> getStudent(String token);
}

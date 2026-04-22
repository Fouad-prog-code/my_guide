import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/request/add_student/add_student_request.dart';

abstract class AddStudentRemoteDataSource {
  Future<AddUserResponse> addStudent(
    AddStudentRequest addStudentRequest,
    String token,
  );
}

import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';
import 'package:my_guide/domain/entities/request/update_student/update_student_request.dart';

abstract class UpdateStudentRemoteDataSource {
  Future<UpdateOrDeleteUserResponse> updateStudent(
    UpdateStudentRequest updateStudentRequest,
    String token,
  );
}

import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_student/update_student_request.dart';

abstract class UpdateStudentRepository {
  Future<UpdateOrDeleteObjectResponse> updateStudent(
    UpdateStudentRequest updateStudentRequest,
    String token,
  );
}

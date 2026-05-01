import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';
import 'package:my_guide/domain/entities/request/update_course/update_course_request.dart';

abstract class UpdateCourseRepository {
  Future<UpdateOrDeleteUserResponse> updateCourse(
    UpdateCourseRequest updateCourseRequest,
    String token,
  );
}

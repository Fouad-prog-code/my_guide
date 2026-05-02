import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_course/update_course_request.dart';

abstract class UpdateCourseRepository {
  Future<UpdateOrDeleteObjectResponse> updateCourse(
    UpdateCourseRequest updateCourseRequest,
    String token,
  );
}

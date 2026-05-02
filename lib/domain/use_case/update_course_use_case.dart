import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_course/update_course_request.dart';
import 'package:my_guide/domain/repositories/update_course_repository.dart';

@injectable
class UpdateCourseUseCase {
  UpdateCourseRepository updateCourseRepository;

  UpdateCourseUseCase({required this.updateCourseRepository});

  Future<UpdateOrDeleteObjectResponse> invoke(
    UpdateCourseRequest updateCourseRequest,
    String token,
  ) {
    return updateCourseRepository.updateCourse(updateCourseRequest, token);
  }
}

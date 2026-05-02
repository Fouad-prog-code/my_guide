import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/update_course_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_course/update_course_request.dart';
import 'package:my_guide/domain/repositories/update_course_repository.dart';

@Injectable(as: UpdateCourseRepository)
class UpdateCourseRepositoryImpl implements UpdateCourseRepository {
  UpdateCourseRemoteDataSource updateCourseRemoteDataSource;

  UpdateCourseRepositoryImpl({required this.updateCourseRemoteDataSource});

  @override
  Future<UpdateOrDeleteObjectResponse> updateCourse(
    UpdateCourseRequest updateCourseRequest,
    String token,
  ) {
    return updateCourseRemoteDataSource.updateCourse(
      updateCourseRequest,
      token,
    );
  }
}

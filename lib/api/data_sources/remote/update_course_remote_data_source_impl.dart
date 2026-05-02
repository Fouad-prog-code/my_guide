import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/update_or_delete_user_response_mapper.dart';
import 'package:my_guide/api/mappers/update_course_request_mapper.dart';
import 'package:my_guide/data/data_sources/remote/update_course_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_course/update_course_request.dart';

@Injectable(as: UpdateCourseRemoteDataSource)
class UpdateCourseRemoteDataSourceImpl implements UpdateCourseRemoteDataSource {
  ApiServices apiServices;

  UpdateCourseRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UpdateOrDeleteObjectResponse> updateCourse(
    UpdateCourseRequest updateCourseRequest,
    String token,
  ) async {
    var response = await apiServices.updateCourse(
      updateCourseRequest.toUpdateCourseRequestDto(),
      'Bearer $token',
    );
    return response.toUpdateOrDeleteObjectResponse();
  }
}

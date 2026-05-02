import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/update_or_delete_user_response_mapper.dart';
import 'package:my_guide/api/mappers/update_student_request_mapper.dart';
import 'package:my_guide/data/data_sources/remote/update_student_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_student/update_student_request.dart';

@Injectable(as: UpdateStudentRemoteDataSource)
class UpdateStudentRemoteDataSourceImpl
    implements UpdateStudentRemoteDataSource {
  ApiServices apiServices;

  UpdateStudentRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UpdateOrDeleteObjectResponse> updateStudent(
    UpdateStudentRequest updateStudentRequest,
    String token,
  ) async {
    var response = await apiServices.updateStudent(
      updateStudentRequest.toUpdateStudentRequestDto(),
      'Bearer $token',
    );
    return response.toUpdateOrDeleteObjectResponse();
  }
}

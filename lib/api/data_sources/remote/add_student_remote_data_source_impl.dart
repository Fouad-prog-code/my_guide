import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/add_student_request_mapper.dart';
import 'package:my_guide/api/mappers/common/add_user_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/add_student_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/request/add_student/add_student_request.dart';

@Injectable(as: AddStudentRemoteDataSource)
class AddStudentRemoteDataSourceImpl implements AddStudentRemoteDataSource {
  ApiServices apiServices;

  AddStudentRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddUserResponse> addStudent(
    AddStudentRequest addStudentRequest,
    String token,
  ) async {
    try {
      var response = await apiServices.addStudent(
        addStudentRequest.toAddStudentRequestDto(),
        'Bearer $token',
      );

      return response.toAddUserResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

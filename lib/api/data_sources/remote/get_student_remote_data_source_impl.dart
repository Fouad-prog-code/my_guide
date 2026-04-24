import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/get_student_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/get_student_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_student/get_student_response.dart';

@Injectable(as: GetStudentRemoteDataSource)
class GetStudentRemoteDataSourceImpl implements GetStudentRemoteDataSource {
  ApiServices apiServices;
  GetStudentRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<GetStudentResponse> getStudent(String token) async {
    try {
      var response = await apiServices.getStudent('Bearer $token');
      return response.toGetStudentResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

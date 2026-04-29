import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/student_schedule_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/student_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/student_schedule_response.dart';

@Injectable(as: StudentRemoteDataSource)
class StudentRemoteDataSourceImpl implements StudentRemoteDataSource {
  ApiServices apiServices;
  StudentRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<StudentScheduleResponse> getStudentSchedule(String tokens) async {
    try {
      var response = await apiServices.getStudentSchedule('Bearer $tokens');
      return response.toStudentScheduleResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

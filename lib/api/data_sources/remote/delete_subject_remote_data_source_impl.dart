import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/delete_doctor_response_mapper.dart';
import 'package:my_guide/api/mappers/delete_subject_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/delete_subject_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/delete_subject/delete_subject_response.dart';

@Injectable(as: DeleteSubjectRemoteDataSource)
class DeleteSubjectRemoteDataSourceImpl
    implements DeleteSubjectRemoteDataSource {
  ApiServices apiServices;

  DeleteSubjectRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<DeleteSubjectResponse> deleteSubject(String name, String token) async {
    try {
      var response = await apiServices.deleteSubject(name, 'Bearer $token');
      return response.toDeleteSubjectResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;

      throw ServerError(errorMessage: message);
    }
  }
}

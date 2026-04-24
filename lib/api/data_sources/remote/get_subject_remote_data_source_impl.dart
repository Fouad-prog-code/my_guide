import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/get_subject_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/get_subject_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_subject/get_subject_response.dart';

@Injectable(as: GetSubjectRemoteDataSource)
class GetSubjectRemoteDataSourceImpl implements GetSubjectRemoteDataSource {
  ApiServices apiServices;

  GetSubjectRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<GetSubjectResponse> getSubject(String token) async {
    try {
      var response = await apiServices.getSubject('Bearer $token');
      return response.toGetSubjectResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

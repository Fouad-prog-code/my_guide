import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/add_subject_request_mapper.dart';
import 'package:my_guide/api/mappers/add_subject_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/add_subject_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/add_subject/add_subject_request.dart';
import 'package:my_guide/domain/entities/response/add_subject/add_subject_response.dart';

@Injectable(as: AddSubjectRemoteDataSource)
class AddSubjectRemoteDataSourceImpl implements AddSubjectRemoteDataSource {
  ApiServices apiServices;

  AddSubjectRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddSubjectResponse> addSubject(
    AddSubjectRequest addSubjectRequest,
    String token,
  ) async {
    try {
      var response = await apiServices.addSubject(
        addSubjectRequest.toAddSubjectRequestDto(),
        'Bearer $token',
      );

      return response.toAddSubjectResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

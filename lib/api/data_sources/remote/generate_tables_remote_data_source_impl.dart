import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/generate_tables_request_mapper.dart';
import 'package:my_guide/api/mappers/generate_tables_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/generate_tables_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/generate_tables/generate_tables_request.dart';
import 'package:my_guide/domain/entities/response/generate_tables/generate_tables_responset.dart';

@Injectable(as: GenerateTablesRemoteDataSource)
class GenerateTablesRemoteDataSourceImpl
    implements GenerateTablesRemoteDataSource {
  ApiServices apiServices;
  GenerateTablesRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<GenerateTablesResponse> generateTables(
    GenerateTablesRequest generateTablesRequest,
    String token,
  ) async {
    try {
      var response = await apiServices.generateTables(
        generateTablesRequest.toGenerateTablesRequestDto(),
        'Bearer $token',
      );
      return response.toGenerateTablesResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

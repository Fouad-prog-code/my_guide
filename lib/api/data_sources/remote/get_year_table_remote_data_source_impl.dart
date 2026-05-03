import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/get_year_table_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/get_year_table_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/year_table/year_table_response.dart';

@Injectable(as: GetYearTableRemoteDataSource)
class GetYearTableRemoteDataSourceImpl implements GetYearTableRemoteDataSource {
  ApiServices apiServices;

  GetYearTableRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<YearTableResponse> getYearTable(String token) async {
    try {
      var response = await apiServices.getYearTable('Bearer $token');
      return response.toYearTableResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

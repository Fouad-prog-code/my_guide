import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/get_manager_response_mapper.dart';
import 'package:my_guide/api/models/response/get_manager/get_manager_response_dto.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/get_manager_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_manager/get_manager_response.dart';

@Injectable(as: GetManagerRemoteDataSource)
class GetManagerRemoteDataSourceImpl implements GetManagerRemoteDataSource {
  ApiServices apiServices;

  GetManagerRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<GetManagerResponse> getManager(String token) async {
    try {
      var response = await apiServices.getManager('Bearer $token');
      return response.toGetManagerResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

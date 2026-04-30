import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/dashboard_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/dashboard_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_dashboard/dashboard_response.dart';

@Injectable(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  ApiServices apiServices;

  DashboardRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<DashboardResponse> getDashboard(String token) async {
    try {
      var response = await apiServices.getDashboard('Bearer $token');
      return response.toDashboardResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/get_department_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/get_department_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_department/get_department_response_dto.dart';

@Injectable(as: GetDepartmentRemoteDataSource)
class GetDepartmentRemoteDataSourceImpl
    implements GetDepartmentRemoteDataSource {
  ApiServices apiServices;
  GetDepartmentRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<GetDepartmentResponse> getDepartment(String token) async {
    try {
      var response = await apiServices.getDepartment('Bearer $token');
      return response.toGetDepartmentResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

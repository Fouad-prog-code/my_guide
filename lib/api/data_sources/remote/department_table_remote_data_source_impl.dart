import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/department_table_respose_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/department_table_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/department_table/department_table_response.dart';

@Injectable(as: DepartmentTableRemoteDataSource)
class DepartmentTableRemoteDataSourceImpl
    implements DepartmentTableRemoteDataSource {
  ApiServices apiServices;
  DepartmentTableRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<DepartmentTableResponse> getDepartmentTable(String token) async {
    try {
      var response = await apiServices.getDepartmentTable('Bearer $token');
      return response.toDepartmentTableResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

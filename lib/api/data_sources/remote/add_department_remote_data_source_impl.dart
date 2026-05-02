import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/add_department_request_mapper.dart';
import 'package:my_guide/api/mappers/add_department_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/add_department_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/add_department/add_department_request.dart';
import 'package:my_guide/domain/entities/response/add_department/add_department_response.dart';

@Injectable(as: AddDepartmentRemoteDataSource)
class AddDepartmentRemoteDataSourceImpl
    implements AddDepartmentRemoteDataSource {
  ApiServices apiServices;

  AddDepartmentRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddDepartmentResponse> addDepartment(
    AddDepartmentRequest addDepartmentRequest,
    String token,
  ) async {
    try {
      var response = await apiServices.addDepartment(
        addDepartmentRequest.toAddDepartmentRequestDto(),
        'Bearer $token',
      );
      return response.toAddDepartmentResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

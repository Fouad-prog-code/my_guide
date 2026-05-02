import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/update_department_request_mapper.dart';
import 'package:my_guide/api/mappers/update_or_delete_user_response_mapper.dart';

import 'package:my_guide/data/data_sources/remote/update_department_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';

import 'package:my_guide/domain/entities/request/update_department/update_department_request.dart';

@Injectable(as: UpdateDepartmentRemoteDataSource)
class UpdateDepartmentRemoteDataSourceImpl
    implements UpdateDepartmentRemoteDataSource {
  ApiServices apiServices;

  UpdateDepartmentRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UpdateOrDeleteObjectResponse> updateDepartment(
    UpdateDepartmentRequest updateDepartmentRequest,
    String token,
  ) async {
    var response = await apiServices.updateDepartment(
      updateDepartmentRequest.toUpdateDepartmentRequestDto(),
      'Bearer $token',
    );

    return response.toUpdateOrDeleteObjectResponse();
  }
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/update_manager_request_mapper.dart';
import 'package:my_guide/api/mappers/update_or_delete_user_response_mapper.dart';
import 'package:my_guide/api/models/common/update_or_delete_object/update_or_delete_object_response_dto.dart';
import 'package:my_guide/api/models/request/update_manager/update_manager_request_dto.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/update_manager_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_manager/update_manager_request.dart';

@Injectable(as: UpdateManagerRemoteDataSource)
class UpdateManagerRemoteDataSourceImpl
    implements UpdateManagerRemoteDataSource {
  ApiServices apiServices;

  UpdateManagerRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UpdateOrDeleteObjectResponse> updateManager(
    UpdateManagerRequest updateManagerRequest,
    String token,
  ) async {
    try {
      var response = await apiServices.updateManager(
        updateManagerRequest.toUpdateManagerRequestDto(),
        'Bearer $token',
      );
      return response.toUpdateOrDeleteObjectResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

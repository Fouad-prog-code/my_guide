import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/update_or_delete_user_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/delete_manager_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';

@Injectable(as: DeleteManagerRemoteDataSource)
class DeleteManagerRemoteDataSourceImpl
    implements DeleteManagerRemoteDataSource {
  ApiServices apiServices;
  DeleteManagerRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<UpdateOrDeleteObjectResponse> deleteManager(
    int managerId,
    String token,
  ) async {
    try {
      var response = await apiServices.deleteManager(
        managerId,
        'Bearer $token',
      );
      return response.toUpdateOrDeleteObjectResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

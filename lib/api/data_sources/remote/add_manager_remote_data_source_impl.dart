import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/add_doctor_request_mapper.dart';
import 'package:my_guide/api/mappers/common/add_user_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/add_manager_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/request/add_doctor_or_manager/add_doctor_or_manager_request.dart';

@Injectable(as: AddManagerRemoteDataSource)
class AddManagerRemoteDataSourceImpl implements AddManagerRemoteDataSource {
  ApiServices apiServices;

  AddManagerRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<AddUserResponse> addManager(
    AddDoctOrManagerRequest addManager,
    String token,
  ) async {
    try {
      var response = await apiServices.addManager(
        addManager.toAddDoctorOrManagerRequestDto(),
        'Bearer $token',
      );
      return response.toAddUserResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

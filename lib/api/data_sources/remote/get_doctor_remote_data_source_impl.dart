import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/get_doctor_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/get_doctor_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_response.dart';

@Injectable(as: GetDoctorRemoteDataSource)
class GetDoctorRemoteDataSourceImpl implements GetDoctorRemoteDataSource {
  ApiServices apiServices;

  GetDoctorRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<GetDoctorResponse> getDoctor(String token) async {
    try {
      var response = await apiServices.getDoctor('Bearer $token');
      return response.toGetDoctorResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

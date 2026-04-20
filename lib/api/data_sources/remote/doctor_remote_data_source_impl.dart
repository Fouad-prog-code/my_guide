import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/doctor_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/doctor_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/doctor/doctor_response.dart';

@Injectable(as: DoctorRemoteDataSource)
class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
  ApiServices apiServices;
  DoctorRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<DoctorResponse> getDoctorSchedule(int doctorId, String token) async {
    try {
      var response = await apiServices.getDoctorSchedule(
        doctorId,
        'Bearer $token',
      );
      return response.toDoctorResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

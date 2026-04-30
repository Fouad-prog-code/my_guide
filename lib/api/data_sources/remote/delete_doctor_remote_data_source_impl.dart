import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/delete_doctor_response_mapper.dart';
import 'package:my_guide/core/errors/app_error.dart';
import 'package:my_guide/data/data_sources/remote/delete_doctor_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/delete_doctor/delete_doctor_response.dart';

@Injectable(as: DeleteDoctorRemoteDataSource)
class DeleteDoctorRemoteDataSourceImpl implements DeleteDoctorRemoteDataSource {
  ApiServices apiServices;
  DeleteDoctorRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<DeleteDoctorResponse> deleteDoctor(int id, String token) async {
    try {
      var response = await apiServices.deleteDoctor(id, 'Bearer $token');
      return response.toDeleteDoctorResponse();
    } on DioException catch (e) {
      final message = (e.error as AppError).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}

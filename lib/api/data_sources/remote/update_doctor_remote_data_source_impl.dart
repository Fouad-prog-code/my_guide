import 'package:injectable/injectable.dart';
import 'package:my_guide/api/api_services.dart';
import 'package:my_guide/api/mappers/update_doctor_request_mapper.dart';
import 'package:my_guide/api/mappers/update_or_delete_user_response_mapper.dart';
import 'package:my_guide/data/data_sources/remote/update_doctor_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/update_doctor/update_doctor_request.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';

@Injectable(as: UpdateDoctorRemoteDataSource)
class UpdateDoctorRemoteDataSourceImpl implements UpdateDoctorRemoteDataSource {
  ApiServices apiServices;

  UpdateDoctorRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<UpdateOrDeleteObjectResponse> updateDoctor(
    UpdateDoctorRequest updateDoctorRequest,
    String token,
  ) async {
    var response = await apiServices.updateDoctor(
      updateDoctorRequest.toUpdateDoctorRequestDto(),
      'Bearer $token',
    );
    return response.toUpdateOrDeleteObjectResponse();
  }
}

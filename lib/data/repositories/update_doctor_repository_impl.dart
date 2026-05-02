import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/update_doctor_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/update_doctor/update_doctor_request.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/repositories/update_doctor_repository.dart';

@Injectable(as: UpdateDoctorRepository)
class UpdateDoctorRepositoryImpl implements UpdateDoctorRepository {
  UpdateDoctorRemoteDataSource updateDoctorRemoteDataSource;
  UpdateDoctorRepositoryImpl({required this.updateDoctorRemoteDataSource});

  @override
  Future<UpdateOrDeleteObjectResponse> updateDoctor(
    UpdateDoctorRequest updateDoctorRequest,
    String token,
  ) {
    return updateDoctorRemoteDataSource.updateDoctor(
      updateDoctorRequest,
      token,
    );
  }
}

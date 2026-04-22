import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/add_doctor_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/add_doctor/add_doctor_request.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/repositories/add_doctor_repository.dart';

@Injectable(as: AddDoctorRepository)
class AddDoctorRepositoryImpl implements AddDoctorRepository {
  AddDoctorRemoteDataSource addDoctorRemoteDataSource;

  AddDoctorRepositoryImpl({required this.addDoctorRemoteDataSource});

  @override
  Future<AddUserResponse> addDoctor(
    AddDoctorRequest addDoctorRequest,
    String token,
  ) {
    return addDoctorRemoteDataSource.addDoctor(addDoctorRequest, token);
  }
}

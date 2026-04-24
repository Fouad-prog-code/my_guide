import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/get_doctor_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_response.dart';
import 'package:my_guide/domain/repositories/get_doctor_repository.dart';

@Injectable(as: GetDoctorRepository)
class GetDoctorRepositoryImpl implements GetDoctorRepository {
  GetDoctorRemoteDataSource getDoctorRemoteDataSource;

  GetDoctorRepositoryImpl({required this.getDoctorRemoteDataSource});

  @override
  Future<GetDoctorResponse> getDoctor(String token) {
    return getDoctorRemoteDataSource.getDoctor(token);
  }
}

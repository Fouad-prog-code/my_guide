import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/doctor_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/doctor/doctor_response.dart';
import 'package:my_guide/domain/repositories/doctor_repository.dart';

@Injectable(as: DoctorRepository)
class DoctorRepositoryImpl implements DoctorRepository {
  DoctorRemoteDataSource doctorRemoteDataSource;

  DoctorRepositoryImpl({required this.doctorRemoteDataSource});
  @override
  Future<DoctorResponse> getDoctorSchedule(int doctorId, String token) {
    return doctorRemoteDataSource.getDoctorSchedule(doctorId, token);
  }
}

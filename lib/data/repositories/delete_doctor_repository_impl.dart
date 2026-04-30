import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/delete_doctor_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/delete_doctor/delete_doctor_response.dart';
import 'package:my_guide/domain/repositories/delete_doctor_repository.dart';

@Injectable(as: DeleteDoctorRepository)
class DeleteDoctorRepositoryImpl implements DeleteDoctorRepository {
  DeleteDoctorRemoteDataSource deleteDoctorRemoteDataSource;

  DeleteDoctorRepositoryImpl({required this.deleteDoctorRemoteDataSource});
  @override
  Future<DeleteDoctorResponse> deleteDoctor(int id, String token) {
    return deleteDoctorRemoteDataSource.deleteDoctor(id, token);
  }
}

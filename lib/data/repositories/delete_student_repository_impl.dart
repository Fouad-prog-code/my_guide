import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/delete_student_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';
import 'package:my_guide/domain/repositories/delete_student_repository.dart';

@Injectable(as: DeleteStudentRepository)
class DeleteStudentRepositoryImpl implements DeleteStudentRepository {
  DeleteStudentRemoteDataSource deleteStudentRemoteDataSource;

  DeleteStudentRepositoryImpl({required this.deleteStudentRemoteDataSource});

  @override
  Future<UpdateOrDeleteUserResponse> deleteStudent(int id, String token) {
    return deleteStudentRemoteDataSource.deleteStudent(id, token);
  }
}

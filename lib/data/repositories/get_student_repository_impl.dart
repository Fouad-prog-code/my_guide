import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/get_student_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_student/get_student_response.dart';
import 'package:my_guide/domain/repositories/get_student_repository.dart';

@Injectable(as: GetStudentRepository)
class GetStudentRepositoryImpl implements GetStudentRepository {
  GetStudentRemoteDataSource getStudentRemoteDataSource;

  GetStudentRepositoryImpl({required this.getStudentRemoteDataSource});
  @override
  Future<GetStudentResponse> getStudent(String token) {
    return getStudentRemoteDataSource.getStudent(token);
  }
}

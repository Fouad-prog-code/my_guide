import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/student_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/student_schedule_response.dart';
import 'package:my_guide/domain/repositories/student_/student_repository.dart';

@Injectable(as: StudentRepository)
class StudentRepositoryImpl implements StudentRepository {
  StudentRemoteDataSource studentRemoteDataSource;
  StudentRepositoryImpl({required this.studentRemoteDataSource});

  @override
  Future<StudentScheduleResponse> getStudentSchedule(String token) {
    return studentRemoteDataSource.getStudentSchedule(token);
  }
}

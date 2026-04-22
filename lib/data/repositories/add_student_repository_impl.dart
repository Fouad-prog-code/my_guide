import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/add_student_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/request/add_student/add_student_request.dart';
import 'package:my_guide/domain/repositories/add_student_repository.dart';

@Injectable(as: AddStudentRepository)
class AddStudentRepositoryImpl implements AddStudentRepository {
  AddStudentRemoteDataSource addStudentRemoteDataSource;

  AddStudentRepositoryImpl({required this.addStudentRemoteDataSource});

  @override
  Future<AddUserResponse> addStudent(
    AddStudentRequest addStudentRequest,
    String token,
  ) {
    return addStudentRemoteDataSource.addStudent(addStudentRequest, token);
  }
}

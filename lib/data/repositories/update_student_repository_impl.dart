import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/update_student_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_student/update_student_request.dart';
import 'package:my_guide/domain/repositories/update_student_repository.dart';

@Injectable(as: UpdateStudentRepository)
class UpdateStudentRepositoryImpl implements UpdateStudentRepository {
  UpdateStudentRemoteDataSource updateStudentRemoteDataSource;

  UpdateStudentRepositoryImpl({required this.updateStudentRemoteDataSource});

  @override
  Future<UpdateOrDeleteObjectResponse> updateStudent(
    UpdateStudentRequest updateStudentRequest,
    String token,
  ) {
    return updateStudentRemoteDataSource.updateStudent(
      updateStudentRequest,
      token,
    );
  }
}

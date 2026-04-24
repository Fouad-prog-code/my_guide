import 'package:my_guide/domain/entities/common/update_or_delete_doctor/update_or_delete_user_response.dart';

abstract class DeleteStudentRemoteDataSource {
  Future<UpdateOrDeleteUserResponse> deleteStudent(int id, String token);
}

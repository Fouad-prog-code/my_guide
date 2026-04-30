import 'package:my_guide/domain/entities/response/delete_subject/delete_subject_response.dart';

abstract class DeleteSubjectRepository {
  Future<DeleteSubjectResponse> deleteSubject(String name, String token);
}

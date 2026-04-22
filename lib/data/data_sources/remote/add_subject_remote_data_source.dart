import 'package:my_guide/domain/entities/request/add_subject/add_subject_request.dart';
import 'package:my_guide/domain/entities/response/add_subject/add_subject_response.dart';

abstract class AddSubjectRemoteDataSource {
  Future<AddSubjectResponse> addSubject(
    AddSubjectRequest addSubjectRequest,
    String token,
  );
}

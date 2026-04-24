import 'package:my_guide/domain/entities/response/get_subject/get_subject_response.dart';

abstract class GetSubjectRemoteDataSource {
  Future<GetSubjectResponse> getSubject(String token);
}

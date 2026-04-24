import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/get_subject/get_subject_response.dart';
import 'package:my_guide/domain/repositories/get_subject_repository.dart';

@injectable
class GetSubjectUseCase {
  GetSubjectRepository getSubjectRepository;

  GetSubjectUseCase({required this.getSubjectRepository});

  Future<GetSubjectResponse> invoke(String token) {
    return getSubjectRepository.getSubject(token);
  }
}

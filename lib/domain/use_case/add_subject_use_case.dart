import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/request/add_subject/add_subject_request.dart';
import 'package:my_guide/domain/entities/response/add_subject/add_subject_response.dart';
import 'package:my_guide/domain/repositories/add_subject_repository.dart';

@injectable
class AddSubjectUseCase {
  AddSubjectRepository addSubjectRepository;

  AddSubjectUseCase({required this.addSubjectRepository});

  Future<AddSubjectResponse> invoke({
    required AddSubjectRequest addSubjectRequest,
    required String token,
  }) {
    return addSubjectRepository.addSubject(addSubjectRequest, token);
  }
}

import 'package:injectable/injectable.dart';
import 'package:my_guide/domain/entities/response/delete_subject/delete_subject_response.dart';
import 'package:my_guide/domain/repositories/delete_subject_repository.dart';

@injectable
class DeleteSubjectUseCase {
  DeleteSubjectRepository deleteSubjectRepository;

  DeleteSubjectUseCase({required this.deleteSubjectRepository});

  Future<DeleteSubjectResponse> invoke(String name, String token) {
    return deleteSubjectRepository.deleteSubject(name, token);
  }
}

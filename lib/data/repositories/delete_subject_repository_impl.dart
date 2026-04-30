import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/delete_subject_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/delete_subject/delete_subject_response.dart';
import 'package:my_guide/domain/repositories/delete_subject_repository.dart';

@Injectable(as: DeleteSubjectRepository)
class DeleteSubjectRepositoryImpl implements DeleteSubjectRepository {
  DeleteSubjectRemoteDataSource deleteSubjectRemoteDataSource;

  DeleteSubjectRepositoryImpl({required this.deleteSubjectRemoteDataSource});

  @override
  Future<DeleteSubjectResponse> deleteSubject(String name, String token) {
    return deleteSubjectRemoteDataSource.deleteSubject(name, token);
  }
}

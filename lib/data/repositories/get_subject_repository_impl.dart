import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/get_subject_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_subject/get_subject_response.dart';
import 'package:my_guide/domain/repositories/get_subject_repository.dart';

@Injectable(as: GetSubjectRepository)
class GetSubjectRepositoryImpl implements GetSubjectRepository {
  GetSubjectRemoteDataSource getSubjectRemoteDataSource;

  GetSubjectRepositoryImpl({required this.getSubjectRemoteDataSource});

  @override
  Future<GetSubjectResponse> getSubject(String token) {
    return getSubjectRemoteDataSource.getSubject(token);
  }
}

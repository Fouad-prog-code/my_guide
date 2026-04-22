import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/add_subject_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/add_subject/add_subject_request.dart';
import 'package:my_guide/domain/entities/response/add_subject/add_subject_response.dart';
import 'package:my_guide/domain/repositories/add_subject_repository.dart';

@Injectable(as: AddSubjectRepository)
class AddSubjectRepositoryImpl implements AddSubjectRepository {
  AddSubjectRemoteDataSource addSubjectRemoteDataSource;

  AddSubjectRepositoryImpl({required this.addSubjectRemoteDataSource});

  @override
  Future<AddSubjectResponse> addSubject(
    AddSubjectRequest addSubjectRequest,
    String token,
  ) {
    return addSubjectRemoteDataSource.addSubject(addSubjectRequest, token);
  }
}

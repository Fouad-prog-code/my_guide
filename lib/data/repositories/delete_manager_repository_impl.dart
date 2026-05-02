import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/delete_manager_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/repositories/delete_manager_repository.dart';

@Injectable(as: DeleteManagerRepository)
class DeleteManagerRepositoryImpl implements DeleteManagerRepository {
  DeleteManagerRemoteDataSource remoteDataSource;
  DeleteManagerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UpdateOrDeleteObjectResponse> deleteManager(
    int managerId,
    String token,
  ) {
    return remoteDataSource.deleteManager(managerId, token);
  }
}

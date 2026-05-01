import 'package:injectable/injectable.dart';

import 'package:my_guide/data/data_sources/remote/get_manager_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_manager/get_manager_response.dart';
import 'package:my_guide/domain/repositories/get_manager_repository.dart';

@Injectable(as: GetManagerRepository)
class GetManagerRepositoryImpl implements GetManagerRepository {
  GetManagerRemoteDataSource remoteDataSource;

  GetManagerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<GetManagerResponse> getManager(String token) async {
    return remoteDataSource.getManager(token);
  }
}

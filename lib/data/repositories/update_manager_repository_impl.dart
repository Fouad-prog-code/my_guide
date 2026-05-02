import 'package:injectable/injectable.dart';

import 'package:my_guide/api/mappers/update_manager_request_mapper.dart';
import 'package:my_guide/api/mappers/update_or_delete_user_response_mapper.dart';
import 'package:my_guide/data/data_sources/remote/update_manager_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/update_or_delete_object/update_or_delete_object_response.dart';
import 'package:my_guide/domain/entities/request/update_manager/update_manager_request.dart';

import 'package:my_guide/domain/repositories/update_manager_repository.dart';

@Injectable(as: UpdateManagerRepository)
class UpdateManagerRepositoryImpl implements UpdateManagerRepository {
  UpdateManagerRemoteDataSource remoteDataSource;

  UpdateManagerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UpdateOrDeleteObjectResponse> updateManager(
    UpdateManagerRequest updateManagerRequest,
    String token,
  ) async {
    var response = await remoteDataSource.updateManager(
      updateManagerRequest,
      token,
    );
    return response;
  }
}

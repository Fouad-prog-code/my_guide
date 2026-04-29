import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/add_manager_remote_data_source.dart';
import 'package:my_guide/domain/entities/common/add_user/add_user_response.dart';
import 'package:my_guide/domain/entities/request/add_doctor_or_manager/add_doctor_or_manager_request.dart';
import 'package:my_guide/domain/repositories/add_manager_repository.dart';

@Injectable(as: AddManagerRepository)
class AddManagerRepositoryImpl implements AddManagerRepository {
  AddManagerRemoteDataSource addManagerRemoteDataSource;

  AddManagerRepositoryImpl({required this.addManagerRemoteDataSource});
  @override
  Future<AddUserResponse> addManager(
    AddDoctOrManagerRequest addManager,
    String token,
  ) {
    return addManagerRemoteDataSource.addManager(addManager, token);
  }
}

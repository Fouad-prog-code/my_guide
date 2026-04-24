import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/update_room_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/updata_room/update_room_request.dart';
import 'package:my_guide/domain/entities/response/updata_room/update_room_response.dart';
import 'package:my_guide/domain/repositories/update_room_repository.dart';

@Injectable(as: UpdateRoomRepository)
class UpdateRoomRepositoryImpl implements UpdateRoomRepository {
  UpdateRoomRemoteDataSource updateRoomRemoteDataSource;

  UpdateRoomRepositoryImpl({required this.updateRoomRemoteDataSource});
  @override
  Future<UpdateRoomResponse> updateRoom(
    UpdateRoomRequest updateRoomRequest,
    String token,
  ) {
    return updateRoomRemoteDataSource.updateRoom(updateRoomRequest, token);
  }
}

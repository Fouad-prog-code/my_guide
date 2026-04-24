import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/delete_room_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/delete_room/delete_room_response.dart';
import 'package:my_guide/domain/repositories/delete_room_repository.dart';

@Injectable(as: DeleteRoomRepository)
class DeleteRoomRepositoryImpl implements DeleteRoomRepository {
  DeleteRoomRemoteDataSource deleteRoomRemoteDataSource;

  DeleteRoomRepositoryImpl({required this.deleteRoomRemoteDataSource});
  @override
  Future<DeleteRoomResponse> deleteRoom(int id, String token) {
    return deleteRoomRemoteDataSource.deleteRoom(id, token);
  }
}

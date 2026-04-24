import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/get_room_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/get_room/get_room_response.dart';
import 'package:my_guide/domain/repositories/get_room_repository.dart';

@Injectable(as: GetRoomRepository)
class GetRoomRepositoryImpl implements GetRoomRepository {
  GetRoomRemoteDataSource getRoomRemoteDataSource;

  GetRoomRepositoryImpl({required this.getRoomRemoteDataSource});

  @override
  Future<GetRoomResponse> getRoom(String token) {
    return getRoomRemoteDataSource.getRoom(token);
  }
}

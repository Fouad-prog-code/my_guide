import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/room_remote_data_source.dart';
import 'package:my_guide/domain/entities/response/room_response.dart';
import 'package:my_guide/domain/repositories/room_/room_repository.dart';

@Injectable(as: RoomRepository)
class RoomRepositoryImpl implements RoomRepository {
  RoomRemoteDataSource roomRemoteDataSource;
  RoomRepositoryImpl({required this.roomRemoteDataSource});
  @override
  Future<RoomResponse> getRooms(String tokens) {
    return roomRemoteDataSource.getRooms(tokens);
  }
}

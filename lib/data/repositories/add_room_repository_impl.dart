import 'package:injectable/injectable.dart';
import 'package:my_guide/data/data_sources/remote/add_room_remote_data_source.dart';
import 'package:my_guide/domain/entities/request/add_room/add_room_request.dart';
import 'package:my_guide/domain/entities/response/add_room/add_room_response.dart';
import 'package:my_guide/domain/repositories/add_room_repository.dart';

@Injectable(as: AddRoomRepository)
class AddRoomRepositoryImpl implements AddRoomRepository {
  AddRoomRemoteDataSource addRoomRemoteDataSource;

  AddRoomRepositoryImpl({required this.addRoomRemoteDataSource});

  @override
  Future<AddRoomResponse> addRoom(AddRoomRequest addRoomRequest, String token) {
    return addRoomRemoteDataSource.addRoom(addRoomRequest, token);
  }
}

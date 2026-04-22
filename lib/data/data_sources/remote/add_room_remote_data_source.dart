import 'package:my_guide/domain/entities/request/add_room/add_room_request.dart';
import 'package:my_guide/domain/entities/response/add_room/add_room_response.dart';

abstract class AddRoomRemoteDataSource {
  Future<AddRoomResponse> addRoom(AddRoomRequest addRoomRequest, String token);
}

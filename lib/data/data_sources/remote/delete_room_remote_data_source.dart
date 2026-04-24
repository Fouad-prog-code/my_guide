import 'package:my_guide/domain/entities/response/delete_room/delete_room_response.dart';

abstract class DeleteRoomRemoteDataSource {
  Future<DeleteRoomResponse> deleteRoom(int id, String token);
}

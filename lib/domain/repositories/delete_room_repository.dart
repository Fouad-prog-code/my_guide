import 'package:my_guide/domain/entities/response/delete_room/delete_room_response.dart';

abstract class DeleteRoomRepository {
  Future<DeleteRoomResponse> deleteRoom(int id, String token);
}

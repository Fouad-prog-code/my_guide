import 'package:my_guide/domain/entities/response/room_response.dart';

abstract class RoomRepository {
  Future<RoomResponse> getRooms(String tokens);
}

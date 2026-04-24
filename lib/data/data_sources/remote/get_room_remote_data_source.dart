import 'package:my_guide/domain/entities/response/get_room/get_room_response.dart';

abstract class GetRoomRemoteDataSource {
  Future<GetRoomResponse> getRoom(String token);
}

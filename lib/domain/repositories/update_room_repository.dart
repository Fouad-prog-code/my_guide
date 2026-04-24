import 'package:my_guide/domain/entities/request/updata_room/update_room_request.dart';
import 'package:my_guide/domain/entities/response/updata_room/update_room_response.dart';

abstract class UpdateRoomRepository {
  Future<UpdateRoomResponse> updateRoom(
    UpdateRoomRequest updateRoomRequest,
    String token,
  );
}

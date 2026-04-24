import 'package:my_guide/api/models/request/updata_room/update_room_request_dto.dart';
import 'package:my_guide/domain/entities/request/updata_room/update_room_request.dart';

extension UpdateRoomRequestMapper on UpdateRoomRequest {
  UpdateRoomRequestDto toUpdateRoomRequestDto() {
    return UpdateRoomRequestDto(
      roomId: roomId,
      roomName: roomName,
      capacity: capacity,
      location: location,
    );
  }
}

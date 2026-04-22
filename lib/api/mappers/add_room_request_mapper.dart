import 'package:my_guide/api/models/request/add_room/add_room_request_dto.dart';
import 'package:my_guide/domain/entities/request/add_room/add_room_request.dart';

extension AddRoomRequestMapper on AddRoomRequest {
  AddRoomRequestDto toAddRoomRequestDto() {
    return AddRoomRequestDto(
      capacity: capacity,
      roomName: roomName,
      location: location,
    );
  }
}

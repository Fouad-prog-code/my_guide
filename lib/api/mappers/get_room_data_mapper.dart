import 'package:my_guide/api/models/response/get_room/get_room_data_dto.dart';
import 'package:my_guide/domain/entities/response/get_room/get_room_data.dart';

extension GetRoomDataMapper on GetRoomDataDto {
  GetRoomData toGetRoomData() {
    return GetRoomData(
      location: location,
      roomName: roomName,
      roomId: roomId,
      capacity: capacity,
    );
  }
}

import 'package:my_guide/api/mappers/room_schedule_mapper.dart';
import 'package:my_guide/api/models/response/data_dto.dart';
import 'package:my_guide/domain/entities/response/data.dart';

extension RoomDataMapper on DataDto {
  Data toRoomData() {
    return Data(
      roomName: roomName,
      roomId: roomId,
      weeklySchedule:
          weeklySchedule?.map((e) => e.toWeeklySchedules()).toList() ?? [],
    );
  }
}

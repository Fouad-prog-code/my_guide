import 'package:my_guide/api/mappers/room_lecture_mapper.dart';
import 'package:my_guide/api/models/response/room_schedules_dto.dart';
import 'package:my_guide/domain/entities/response/room_schdeules.dart';

extension RoomScheduleMapper on WeeklyScheduleDto {
  WeeklySchedule toWeeklySchedules() {
    return WeeklySchedule(
      dayName: dayName,
      lectures: lectures?.map((e) => e.toRoomLectures()).toList() ?? [],
    );
  }
}

import 'package:my_guide/api/models/response/lectures_dto.dart';
import 'package:my_guide/domain/entities/response/lectures.dart';

extension RoomLectuureMapper on LecturesDto {
  Lectures toRoomLectures() {
    return Lectures(
      startTime: startTime,
      endTime: endTime,
      lecturerName: lecturerName,
      subjectName: subjectName,
    );
  }
}

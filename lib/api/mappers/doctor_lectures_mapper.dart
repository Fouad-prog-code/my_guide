import 'package:my_guide/api/models/response/doctor/doctor_lectures_dto.dart';
import 'package:my_guide/domain/entities/response/doctor/doctor_lectures.dart';

extension DoctorLecturesMapper on DoctorLecturesDto {
  DoctorLectures toDoctorLectures() {
    return DoctorLectures(
      courseName: courseName,
      startTime: startTime,
      endTime: endTime,
      roomName: roomName,
      gradeName: gradeName,
    );
  }
}

import 'package:my_guide/api/models/response/student_lecture_dto.dart';
import 'package:my_guide/domain/entities/response/student_lecture.dart';

extension StudentLectureMapper on StudentLectureDto {
  StudentLecture toStudentLecture() {
    return StudentLecture(
      subjectName: subjectName,
      startTime: startTime,
      endTime: endTime,
      roomName: roomName,
      doctorName: doctorName,
    );
  }
}

import 'package:my_guide/api/mappers/student_lecture_mapper.dart';
import 'package:my_guide/api/models/response/student_day_dto.dart';
import 'package:my_guide/domain/entities/response/student_day.dart';

extension StudentDayMapper on StudentDayDto {
  StudentDay toStudentDay() {
    return StudentDay(
      dayOfWeek: dayOfWeek,
      lecturesCount: lecturesCount,
      lectures: lectures?.map((e) => e.toStudentLecture()).toList() ?? [],
    );
  }
}

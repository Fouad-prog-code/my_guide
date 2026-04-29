import 'package:my_guide/domain/entities/response/student_lecture.dart';

class StudentDay {
  final String? dayOfWeek;

  final int? lecturesCount;

  final List<StudentLecture>? lectures;

  StudentDay({this.dayOfWeek, this.lecturesCount, this.lectures});
}

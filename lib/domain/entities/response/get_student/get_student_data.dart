import 'package:my_guide/domain/entities/response/get_student/view_student_dots.dart';

class GetStudentData {
  final String? yearName;

  final List<ViewStudentDots>? viewStudentDtos;

  GetStudentData({this.yearName, this.viewStudentDtos});
}

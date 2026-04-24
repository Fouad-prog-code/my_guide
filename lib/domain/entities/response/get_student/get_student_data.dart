import 'package:my_guide/domain/entities/response/get_student/view_student.dart';

class GetStudentData {
  final String? yearName;

  final List<ViewStudent>? viewStudentDtos;

  GetStudentData({this.yearName, this.viewStudentDtos});
}

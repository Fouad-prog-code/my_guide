import 'package:my_guide/api/models/response/get_student/view_student_dots_dto.dart';

import 'package:my_guide/domain/entities/response/get_student/view_student_dots.dart';

extension ViewStudentMapper on ViewStudentDtosDto {
  ViewStudentDots toViewStudentDots() {
    return ViewStudentDots(
      studentName: studentName,
      studentId: studentId,
      departmentName: departmentName,
      userName: userName,
      nationalId: nationalId,
    );
  }
}

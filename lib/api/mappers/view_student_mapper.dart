import 'package:my_guide/api/models/response/get_student/view_student_dto.dart';
import 'package:my_guide/domain/entities/response/get_student/view_student.dart';

extension ViewStudentMapper on ViewStudentDto {
  ViewStudent toViewStudent() {
    return ViewStudent(
      studentName: studentName,
      studentId: studentId,
      departmentName: departmentName,
      userName: userName,
    );
  }
}

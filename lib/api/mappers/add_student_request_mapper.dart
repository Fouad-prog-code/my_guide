import 'package:my_guide/api/models/request/add_student/add_student_request_dto.dart';
import 'package:my_guide/domain/entities/request/add_student/add_student_request.dart';

extension AddStudentRequestMapper on AddStudentRequest {
  AddStudentRequestDto toAddStudentRequestDto() {
    return AddStudentRequestDto(
      fullName: fullName,
      userName: userName,
      password: password,
      nationalId: nationalId,
      yearName: yearName,
      deptName: deptName,
    );
  }
}

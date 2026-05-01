import 'package:my_guide/api/models/request/update_student/update_student_request_dto.dart';
import 'package:my_guide/domain/entities/request/update_student/update_student_request.dart';

extension UpdateStudentRequestMapper on UpdateStudentRequest {
  UpdateStudentRequestDto toUpdateStudentRequestDto() {
    return UpdateStudentRequestDto(
      id: id,
      nationalId: nationalId,
      fullName: fullName,
      username: userName,
      academicYear: academicYear,
      department: department,
    );
  }
}

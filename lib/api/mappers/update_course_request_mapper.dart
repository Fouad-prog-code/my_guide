import 'package:my_guide/api/models/request/update_course/update_course_request_dto.dart';
import 'package:my_guide/domain/entities/request/update_course/update_course_request.dart';

extension UpdateCourseRequestMapper on UpdateCourseRequest {
  UpdateCourseRequestDto toUpdateCourseRequestDto() {
    return UpdateCourseRequestDto(
      id: id,
      name: name,
      doctorName: doctorName,
      academicYear: academicYear,
      departments: departments,
    );
  }
}

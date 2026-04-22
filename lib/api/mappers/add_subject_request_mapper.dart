import 'package:my_guide/api/models/request/add_subject/add_subject_request_dto.dart';
import 'package:my_guide/domain/entities/request/add_subject/add_subject_request.dart';

extension AddSubjectRequestMapper on AddSubjectRequest {
  AddSubjectRequestDto toAddSubjectRequestDto() {
    return AddSubjectRequestDto(
      lectureName: lectureName,
      doctorName: doctorName,
      yearName: yearName,
      departmentNames: departmentNames,
    );
  }
}

import 'package:my_guide/api/models/response/get_subject/get_subject_data_dto.dart';
import 'package:my_guide/domain/entities/response/get_subject/get_subject_data.dart';

extension GetSubjectDataMapper on GetSubjectDataDto {
  GetSubjectData toGetSubjectData() {
    return GetSubjectData(
      id: id,
      subjectName: subjectName,
      doctorName: doctorName,
      academicYear: academicYear,
      departments: departments,
    );
  }
}

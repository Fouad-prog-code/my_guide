import 'package:my_guide/api/mappers/view_student_mapper.dart';
import 'package:my_guide/api/models/response/get_student/get_student_data_dto.dart';
import 'package:my_guide/domain/entities/response/get_student/get_student_data.dart';

extension GetStudentDataMapper on GetStudentDataDto {
  GetStudentData toGetStudentData() {
    return GetStudentData(
      yearName: yearName,
      viewStudentDtos:
          viewStudentDtos?.map((s) => s.toViewStudent()).toList() ?? [],
    );
  }
}

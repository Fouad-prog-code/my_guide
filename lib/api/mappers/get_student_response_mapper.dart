import 'package:my_guide/api/mappers/get_student_data_mapper.dart';
import 'package:my_guide/api/models/response/get_student/get_student_response_dto.dart';
import 'package:my_guide/domain/entities/response/get_student/get_student_response.dart';

extension GetStudentResponseMapper on GetStudentResponseDto {
  GetStudentResponse toGetStudentResponse() {
    return GetStudentResponse(
      message: message,
      meta: meta,
      errors: errors,
      statusCode: statusCode,
      succeeded: succeeded,
      data: data?.map((student) => student.toGetStudentData()).toList() ?? [],
    );
  }
}
